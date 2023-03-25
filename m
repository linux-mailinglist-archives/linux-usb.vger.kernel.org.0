Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F3BC76C89D4
	for <lists+linux-usb@lfdr.de>; Sat, 25 Mar 2023 02:16:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231778AbjCYBQB (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 24 Mar 2023 21:16:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57402 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231394AbjCYBQA (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 24 Mar 2023 21:16:00 -0400
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com [IPv6:2a00:1450:4864:20::435])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E7F07199FF
        for <linux-usb@vger.kernel.org>; Fri, 24 Mar 2023 18:15:58 -0700 (PDT)
Received: by mail-wr1-x435.google.com with SMTP id q19so330738wrc.5
        for <linux-usb@vger.kernel.org>; Fri, 24 Mar 2023 18:15:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679706957;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=91JluRBFfo+dlggEBHCntk5mXH0WhZHFPFTV+W3q65A=;
        b=jua+I+0LERUgkWhnDauB+vRIJ3XOFGdJc1FIdxQJGTpFXnUYFpnl1M0FyI4P2Z1W7y
         SBkIyY/OfoMI0psdCONRTL4ZS63kHA2iqXyIM0nN/dGJZAZmcA5gYP6rOxZOgHRKM7f6
         bHFgD/PQb+oenN+MNtzTDoPuecsojvuxoHLbIEEY8nhj6P8lgUbQ8c3QGuT0p6uPGR5x
         JUPBdI2HQoxVGYUSiWLE/4xzQWlwguwZ0huEk1hOxrzfTluA8x98Ua7M0Bra5mGAmbkK
         TKZk/uzeOLWEqXSzFBx1aqglCYn7EHy/Y6qw/hMeDxv2Pb2YBsd0Tec1Zc1da1LXTwPB
         3dYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679706957;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=91JluRBFfo+dlggEBHCntk5mXH0WhZHFPFTV+W3q65A=;
        b=LDYhHmhtaMwi3+AL1YlnCUM03XiZMCNRKKhVp8vlN7B/0YHayxJv3IpPibCoRrX0YI
         AtwY6dXPD6nL7CrWCyw58nQlhe6LR/dAgtj1e5yur2wnwyqYGe2CGFWSCGNyVGBg0bxW
         On6J9FHlWoZWAdWohlsoeQjCaoye/PdTz8jkWrcrCW/5L7h7dVh2HuuD6Ynm17n5nvQM
         JPL19RL4AuqMgTvH6pgkiV32+Xti0ETW1GKF0NlRvK2syQM2b8fL9KURthFCayHmO50l
         3v94twVoewqLAqUzJ5tlXTyrOYKgXF+zbKuSkT4X16/VEn1RXDofxi0fm0bx8DUxRKon
         G89A==
X-Gm-Message-State: AAQBX9dxByVP4j+kCKTniLawOT2OpZoYuwfvC4R+bJJSiLNEoaHsqWa/
        DbVwyinNNaqMQVDkdfvsudaZNQ==
X-Google-Smtp-Source: AKy350Yjykwk41eTTI/jmOLP4o6VFGNDREt+tUzeDa17Mh38H5PS9kamgNeEo2vSNrOoeb0jsRZG/Q==
X-Received: by 2002:a05:6000:50b:b0:2db:bca:ac7d with SMTP id a11-20020a056000050b00b002db0bcaac7dmr3475033wrf.67.1679706957465;
        Fri, 24 Mar 2023 18:15:57 -0700 (PDT)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id a4-20020adffb84000000b002d322b9a7f5sm19456548wrr.88.2023.03.24.18.15.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Mar 2023 18:15:56 -0700 (PDT)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     linux@roeck-us.net, heikki.krogerus@linux.intel.com,
        andersson@kernel.org, robh@kernel.org, gregkh@linuxfoundation.org,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Subject: [RFC PATCH 1/1] usb: typec: tcpm: Support role-switch remote endpoint in connector
Date:   Sat, 25 Mar 2023 01:15:52 +0000
Message-Id: <20230325011552.2241155-2-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230325011552.2241155-1-bryan.odonoghue@linaro.org>
References: <20230325011552.2241155-1-bryan.odonoghue@linaro.org>
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

Right now in TCPM when we want to send a role-switch message the
remote-endpoint must appear inside of the TCPM bound node, not in the
connector associated with TCPM.

&typec {
	status = "okay";

	port {
		typec_role_switch: endpoint {
			remote-endpoint = <&dwc3_role_switch>;
		};
	};

	connector {
		compatible = "usb-c-connector";

		power-role = "source";
		data-role = "dual";
		self-powered;

		ports {
			#address-cells = <1>;
			#size-cells = <0>;

			port@0 {
				reg = <0>;
				typec_mux: endpoint {
					remote-endpoint = <&phy_typec_mux>;
				};
			};
		};
	};
};

This change makes it possible to declare the remote-endpoint inside of the
connector of the TCPM e.g.

&typec {
	status = "okay";

	connector {
		compatible = "usb-c-connector";

		power-role = "source";
		data-role = "dual";
		self-powered;

		ports {
			#address-cells = <1>;
			#size-cells = <0>;

			port@0 {
				reg = <0>;
				typec_role_switch: endpoint {
					remote-endpoint = <&dwc3_role_switch>;
				};
			};
			port@1 {
				reg = <1>;
				typec_mux: endpoint {
					remote-endpoint = <&phy_typec_mux>;
				};
			};
		};
	};
};

Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 drivers/usb/typec/tcpm/tcpm.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/usb/typec/tcpm/tcpm.c b/drivers/usb/typec/tcpm/tcpm.c
index 1ee774c263f08..a62fecf3bb44c 100644
--- a/drivers/usb/typec/tcpm/tcpm.c
+++ b/drivers/usb/typec/tcpm/tcpm.c
@@ -6515,6 +6515,7 @@ static enum hrtimer_restart send_discover_timer_handler(struct hrtimer *timer)
 struct tcpm_port *tcpm_register_port(struct device *dev, struct tcpc_dev *tcpc)
 {
 	struct tcpm_port *port;
+	struct fwnode_handle *fwnode;
 	int err;
 
 	if (!dev || !tcpc ||
@@ -6582,6 +6583,14 @@ struct tcpm_port *tcpm_register_port(struct device *dev, struct tcpc_dev *tcpc)
 		goto out_destroy_wq;
 	}
 
+	if (!port->role_sw) {
+		fwnode = device_get_named_child_node(port->dev, "connector");
+		if (fwnode) {
+			port->role_sw = fwnode_usb_role_switch_get(fwnode);
+			fwnode_handle_put(fwnode);
+		}
+	}
+
 	err = devm_tcpm_psy_register(port);
 	if (err)
 		goto out_role_sw_put;
-- 
2.39.2

