component Reference.Container {
  connect ListItems exposing {
    JUSTIFY_CONTENT_ITEMS,
    ORIENTATION_ITEMS,
    ALING_ITEMS_ITEMS
  }

  state justify : String = "stretch"
  state align : String = "center"
  state gap : Number = 20

  const CHILDREN =
    {
      @format {
        <div style="background: gray;min-width: 100px;min-height: 100px;"/>
      },
      @format {
        <div style="background: gray;min-width: 50px;min-height: 50px;"/>
      },
      @format {
        <div style="background: gray;min-width: 25px;min-height: 25px;"/>
      }
    }

  state orientation : String =
    if (Ui.mobile) {
      "vertical"
    } else {
      "horizontal"
    }

  get playgroundCode : String {
    "Ui.Container"
    |> ComponentBuilder.new()
    |> ComponentBuilder.addString("orientation", orientation)
    |> ComponentBuilder.addSizePx("gap", gap)
    |> ComponentBuilder.addString("justify", justify)
    |> ComponentBuilder.addString("align", align)
    |> ComponentBuilder.addChild(CHILDREN[0][1])
    |> ComponentBuilder.addChild(CHILDREN[1][1])
    |> ComponentBuilder.addChild(CHILDREN[2][1])
    |> ComponentBuilder.setAddNewLines(false)
    |> ComponentBuilder.toString()
  }

  fun render : Html {
    <>
      <Ui.Box title=<{ "Ui.Container" }>>
        <p>"This component displays it's children in a only one axis grid (in a line)."</p>
      </Ui.Box>

      <DocBox
        title="Interactive Demo"
        content={
          <p>
            "You can play around with a "

            <code>"Ui.Container"</code>

            " below using the controls:"
          </p>
        }
        example={
          <Example
            fullWidth={true}
            controls=<{
              <Ui.Field label="Orientation">
                <Ui.Native.Select
                  onChange={(value : String) { next { orientation = value } }}
                  items={ORIENTATION_ITEMS}
                  value={orientation}/>
              </Ui.Field>

              <Ui.Field label="Justify">
                <Ui.Native.Select
                  onChange={(value : String) { next { justify = value } }}
                  items={JUSTIFY_CONTENT_ITEMS}
                  value={justify}/>
              </Ui.Field>

              <Ui.Field label="Align">
                <Ui.Native.Select
                  onChange={(value : String) { next { align = value } }}
                  items={ALING_ITEMS_ITEMS}
                  value={align}/>
              </Ui.Field>

              <Ui.Field label="Gap (#{gap}px)">
                <Ui.Slider
                  onChange={(value : Number) { next { gap = value } }}
                  value={gap}
                  max={100}
                  min={0}/>
              </Ui.Field>
            }>
            data={
              {
                <Ui.Container
                  orientation={orientation}
                  justify={justify}
                  align={align}
                  gap={Ui.Size::Px(gap)}>

                  <{ CHILDREN[0][0] }>
                  <{ CHILDREN[1][0] }>
                  <{ CHILDREN[2][0] }>

                </Ui.Container>,
                playgroundCode
              }
            }/>
        }/>

      <DocBox
        title="Gap"
        content={
          <p>
            "The space betweem the items can be controlled usign the "

            <code>"gap"</code>

            " property."
          </p>
        }
        example={
          <Example
            verticalSpacing={50}
            highlight=[1, 7, 13]
            data={
              @format {
                <>
                  <Ui.Container gap={Ui.Size::Px(10)}>
                    <div style="background: gray;min-height: 100px;min-width:100px;"/>
                    <div style="background: gray;min-height: 50px;min-width:50px;"/>
                    <div style="background: gray;min-height: 25px;min-width:25px;"/>
                  </Ui.Container>

                  <Ui.Container gap={Ui.Size::Px(30)}>
                    <div style="background: gray;min-height: 100px;min-width:100px;"/>
                    <div style="background: gray;min-height: 50px;min-width:50px;"/>
                    <div style="background: gray;min-height: 25px;min-width:25px;"/>
                  </Ui.Container>

                  <Ui.Container gap={Ui.Size::Px(60)}>
                    <div style="background: gray;min-height: 100px;min-width:100px;"/>
                    <div style="background: gray;min-height: 50px;min-width:50px;"/>
                    <div style="background: gray;min-height: 25px;min-width:25px;"/>
                  </Ui.Container>
                </>
              }
            }/>
        }/>

      <DocBox
        title="Orientation"
        content={
          <p>
            "The orirentation of the items can be controlled usign the "

            <code>"orientation"</code>

            " property."
          </p>
        }
        example={
          <Example
            horizontalSpacing={50}
            highlight=[1, 7]
            data={
              @format {
                <>
                  <Ui.Container orientation="horizontal">
                    <div style="background: gray;min-height: 100px;min-width:100px;"/>
                    <div style="background: gray;min-height: 50px;min-width:50px;"/>
                    <div style="background: gray;min-height: 25px;min-width:25px;"/>
                  </Ui.Container>

                  <Ui.Container orientation="vertical">
                    <div style="background: gray;min-height: 100px;min-width:100px;"/>
                    <div style="background: gray;min-height: 50px;min-width:50px;"/>
                    <div style="background: gray;min-height: 25px;min-width:25px;"/>
                  </Ui.Container>
                </>
              }
            }/>
        }/>

      <DocBox
        title="Align"
        content={
          <p>
            "The the alingment of the items can be controlled usign the "

            <code>"align"</code>

            " property."
          </p>
        }
        example={
          <Example
            horizontalSpacing={50}
            highlight=[1, 7, 13]
            data={
              @format {
                <>
                  <Ui.Container align="start">
                    <div style="background: gray;min-height: 100px;min-width:100px;"/>
                    <div style="background: gray;min-height: 50px;min-width:50px;"/>
                    <div style="background: gray;min-height: 25px;min-width:25px;"/>
                  </Ui.Container>

                  <Ui.Container align="center">
                    <div style="background: gray;min-height: 100px;min-width:100px;"/>
                    <div style="background: gray;min-height: 50px;min-width:50px;"/>
                    <div style="background: gray;min-height: 25px;min-width:25px;"/>
                  </Ui.Container>

                  <Ui.Container align="end">
                    <div style="background: gray;min-height: 100px;min-width:100px;"/>
                    <div style="background: gray;min-height: 50px;min-width:50px;"/>
                    <div style="background: gray;min-height: 25px;min-width:25px;"/>
                  </Ui.Container>
                </>
              }
            }/>
        }/>

      <DocBox
        title="Justify"
        content={
          <p>
            "The the justification of the items can be controlled usign the "

            <code>"justify"</code>

            " property."
          </p>
        }
        example={
          <Example
            highlight=[1, 7, 13]
            verticalSpacing={50}
            fullWidth={true}
            data={
              @format {
                <>
                  <Ui.Container justify="start">
                    <div style="background: gray;min-height: 100px;min-width:100px;"/>
                    <div style="background: gray;min-height: 50px;min-width:50px;"/>
                    <div style="background: gray;min-height: 25px;min-width:25px;"/>
                  </Ui.Container>

                  <Ui.Container justify="center">
                    <div style="background: gray;min-height: 100px;min-width:100px;"/>
                    <div style="background: gray;min-height: 50px;min-width:50px;"/>
                    <div style="background: gray;min-height: 25px;min-width:25px;"/>
                  </Ui.Container>

                  <Ui.Container justify="end">
                    <div style="background: gray;min-height: 100px;min-width:100px;"/>
                    <div style="background: gray;min-height: 50px;min-width:50px;"/>
                    <div style="background: gray;min-height: 25px;min-width:25px;"/>
                  </Ui.Container>
                </>
              }
            }/>
        }/>
    </>
  }
}
