Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9476E6C89D3
	for <lists+linux-usb@lfdr.de>; Sat, 25 Mar 2023 02:16:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231716AbjCYBQA (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 24 Mar 2023 21:16:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57386 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231359AbjCYBP7 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 24 Mar 2023 21:15:59 -0400
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com [IPv6:2a00:1450:4864:20::435])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F0282199F9
        for <linux-usb@vger.kernel.org>; Fri, 24 Mar 2023 18:15:57 -0700 (PDT)
Received: by mail-wr1-x435.google.com with SMTP id m2so3393371wrh.6
        for <linux-usb@vger.kernel.org>; Fri, 24 Mar 2023 18:15:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679706956;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=dippOyZjrRHAIKaqvrmI00/IUGEMGO8XZmymOkk7sfU=;
        b=U6pQShNwbpsd0EYIHBC09okT2kRYWbhTKjM/3fRC4NF9y1scmA0PQENaeoWdb7GSwb
         tngBgSAodTjKjtxtNXSBPEmo/L/n6tyKUAG7JCGB4Bxx0r3fMS3O4AGtlive54zBzRwn
         qPPFa7ORXNpAt0RN+wuoHGpOSU/6Kdvnll22K4/drv/LV1jBKdkD9nwdRWireM7UJ6Py
         QSRN8kr7K6stqS44ko/+1pIz4i1wI/S0RZokpqBObd49YA5CyqKMGLoh1N8IiLZQJrt8
         kA5VIkCC6TOZTDobr+2hl2LFX3ikaIp27iP5FENkE4cgN3tnXQWfWWua3709cDzAL5NI
         O4+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679706956;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dippOyZjrRHAIKaqvrmI00/IUGEMGO8XZmymOkk7sfU=;
        b=Rmk7ke80mLld3cD8XKO+3tfmqfcMF0vlCEfwWWptHJhWMOJ5P5G4VJZH18uWD04Zzf
         hEhNdRwTh2nwCas1K8a0jySWK0IxII6oSDGerXO3AL/Dw5snEmMEbV34SBC0FzC+UJRX
         PLcq+fpiK4FB1b3ibP+m1v095Wbtb+2y3vUCYFTVO+gGH6/TuXW0XoSPSf6FRNuIoq83
         ezVCa1gYxsQgoN1NdeCcduKxThlgZcqgnUekEjtEzbxdryXS/sNmh1qKFbr8NXFeo3o4
         msrDKt1rRrc09ok794hWpk4JLYY1fn4WmF/dEtA0SZqsQbWdvvnV2yWdYCSK4uWVP9dm
         WcHg==
X-Gm-Message-State: AAQBX9d5mP8TFnTH5hyEVXNnVXUEoCKZ5/o/YCzBvm2Cg5xa8NAN2HPY
        Oo73Jfs5WubPaxowQ6kHSf40Ct2qr91H338+UHo=
X-Google-Smtp-Source: AKy350bizrJkNJ8gvyPwMD4ctlrZRFTj8atwQJz9haTNEn7tY4gmKHUejQe9UJ9KkwfHf03L9P6v5w==
X-Received: by 2002:a5d:6284:0:b0:2d4:493c:81ad with SMTP id k4-20020a5d6284000000b002d4493c81admr3410462wru.5.1679706956437;
        Fri, 24 Mar 2023 18:15:56 -0700 (PDT)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id a4-20020adffb84000000b002d322b9a7f5sm19456548wrr.88.2023.03.24.18.15.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Mar 2023 18:15:55 -0700 (PDT)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     linux@roeck-us.net, heikki.krogerus@linux.intel.com,
        andersson@kernel.org, robh@kernel.org, gregkh@linuxfoundation.org,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Subject: [RFC PATCH 0/1] Add TCPM connector role-switch endpoint binding
Date:   Sat, 25 Mar 2023 01:15:51 +0000
Message-Id: <20230325011552.2241155-1-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Speaking to Rob Herring and Bjorn Andersson about aligning the Qualcomm
PMIC Type-C code with the Qualcomm PMIC GLINK Type-C code I ended up in a
conversation with Bjorn about where various nodes are declared.

If we look at how GLINK declares its bindings we see the usb_role endpoint
is at the same scope as the connector. This is I believe the format the Rob
and Bjorn agreed on.

Documentation/devicetree/bindings/soc/qcom/qcom,pmic-glink.yaml

connector@0 {
    compatible = "usb-c-connector";
    reg = <0>;
    power-role = "dual";
    data-role = "dual";

    ports {
        #address-cells = <1>;
        #size-cells = <0>;

        port@0 {
            reg = <0>;
            glink_role_switch: endpoint {
                remote-endpoint = <&usb_role>;
            };
        };

        port@1 {
            reg = <1>;
            endpoint {
                remote-endpoint = <&ss_phy_out>;
            };
        };

        port@2 {
            reg = <2>;
            endpoint {
                remote-endpoint = <&sbu_mux>;
            };
        };
    };
};

Implicit in the above declaration is a node that does the following:

usb_controller {
    usb-role-switch;
    port {
        usb_role: endpoint {
            remote-endpoint = <&glink_role_switch>;
        }
    };
};

In TCPM what we have a situation where we document something like the above
Documentation/devicetree/bindings/usb/typec-tcpci.txt

ptn5110@50 {
    compatible = "nxp,ptn5110";
    reg = <0x50>;
    interrupt-parent = <&gpio3>;
    interrupts = <3 IRQ_TYPE_LEVEL_LOW>;

    usb_con: connector {
        compatible = "usb-c-connector";
        label = "USB-C";
        data-role = "dual";
        power-role = "dual";
        try-power-role = "sink";
        source-pdos = <PDO_FIXED(5000, 2000, PDO_FIXED_USB_COMM)>;
        sink-pdos = <PDO_FIXED(5000, 2000, PDO_FIXED_USB_COMM)
                               PDO_VAR(5000, 12000, 2000)>;
        op-sink-microwatt = <10000000>;

        ports {
            #address-cells = <1>;
            #size-cells = <0>;

            port@1 {
                reg = <1>;
                usb_con_ss: endpoint {
                    remote-endpoint = <&usb3_data_ss>;
                };
            };
        };
    };
};

However because of how tcpm.c looks up the remote-endpoint this example
actually _declares_ like this with the role-switch node having to be
declared outside of the connector.

arch/arm64/boot/dts/freescale/imx8mm-evk.dtsi

ptn5110: tcpc@50 {
    compatible = "nxp,ptn5110";
    pinctrl-names = "default";
    pinctrl-0 = <&pinctrl_typec1>;
    reg = <0x50>;
    interrupt-parent = <&gpio2>;
    interrupts = <11 8>;
    status = "okay";

    port {
        typec1_dr_sw: endpoint {
            remote-endpoint = <&usb1_drd_sw>;
        };
    };

    typec1_con: connector {
        compatible = "usb-c-connector";
        label = "USB-C";
        power-role = "dual";
        data-role = "dual";
        try-power-role = "sink";
        source-pdos = <PDO_FIXED(5000, 3000, PDO_FIXED_USB_COMM)>;
        sink-pdos = <PDO_FIXED(5000, 3000, PDO_FIXED_USB_COMM)
                     PDO_VAR(5000, 20000, 3000)>;
        op-sink-microwatt = <15000000>;
        self-powered;
    };
};

I''m sending the next patch as an RFC. What that patch does is make it
possible for the TCPM code to find the glink.yaml or the typec-tcpci.txt
way of declaring the role-switch remote-endpoint inside of the connector
like we document.

It doesn't get rid of the exiting one-level higher declaration since that's
extra work and I'm not sure of the provenance of the existing code i.e. why
it currently depends on the one-level up approach. Also I'm wondering about
dtb backwards compatibility etc.

In any case the RFC patch that comes next allows TCPM dts to declare their
role-switch remote endpoints in the connector as per my understanding of
what Bjorn and Rob had discussed.

Perhaps the approach of having the remote-endpoint outside of the connector
has some very good reason but as I read the above typec-tcpci.txt and then
the imx8mm-evk.dtsi it seems to me as if we documented how we would like
for it work only to implement it how it currently works.

That is my experience too developing TCPM for the pm8150b PMIC - I have to
declare the role-switch endpoint outside of the connector.

Anyway I'd appreciate thoughts on this one, it seems to me the right place
for the data role switch remote endpoint to go is into the connector{};

Bryan O'Donoghue (1):
  usb: typec: tcpm: Support role-switch remote endpoint in connector

 drivers/usb/typec/tcpm/tcpm.c | 9 +++++++++
 1 file changed, 9 insertions(+)

-- 
2.39.2

