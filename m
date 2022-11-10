Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 703D862441D
	for <lists+linux-usb@lfdr.de>; Thu, 10 Nov 2022 15:20:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231218AbiKJOUT (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 10 Nov 2022 09:20:19 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51898 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230204AbiKJOUS (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 10 Nov 2022 09:20:18 -0500
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 97C2E19C19
        for <linux-usb@vger.kernel.org>; Thu, 10 Nov 2022 06:20:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net; s=s31663417;
        t=1668090012; bh=+xTDdfFwThUHKDUFnP4/O1XXbKLRBMbOgCK43A3Fetc=;
        h=X-UI-Sender-Class:Date:From:To:Subject;
        b=VlxsByVECwmF/y1gNbL7Zb5RX9eI8lM++OObP1UWqKoFGk2jkA4bQhxe2D9/TIHoa
         XLLF/Lt1/fcezcVjKvtye1FgKFxUiUSvB/viMSKDFybpU/84wNeQOOyk514mtxaEd7
         1d/W5z8WFV3T5Of2nT7Xpn2HAzCJWBe4pfMJMBgc8tdUOu1iwuoqcG4jgymfBN7tLG
         qGY4q9XRCQX7FMfaacFK6fuucow0fKpel3FxLU1JFCr9/L8IsYCR0ExuGW5hvScd+g
         UZrR+jsDZVtvtdeIQvqxQfCaZANUWFZX1cBuCYleoJmw1FMqUF+ULl5fhfX+BtLl4+
         uoynY8IClZg1Q==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from 9300 ([93.221.18.29]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1M4JmN-1osrQg41Gz-000KTC; Thu, 10
 Nov 2022 15:20:12 +0100
Date:   Thu, 10 Nov 2022 15:20:11 +0100 (CET)
From:   Andreas Bergmeier <abergmeier@gmx.net>
To:     USB mailing list <linux-usb@vger.kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>
Subject: PATCH: Simplify hidpp_send_rap_command_sync calls
Message-ID: <d32177ad-f796-62c5-d66f-72d3f6ec2d29@9300>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-Provags-ID: V03:K1:EjcIiiEkmGmyFAUWM7wWByGrrbyMzPIJ2mQaiBc22n+kXE8RBxc
 XmXedfsZbYZhUZ71IUcFo++RBUDFGq96P8ZaLDRHYaD/HYsnzqcvYhej6BSuoFTSair0yq0
 fNl2kst6AkYZPyiHfgj5fUKTtffKiXEB+XpqC25ynGgZLRhmD+N3DOpHRqJwoCPfjnlYYgT
 5XgTHKY0dHJCRhAd3wX0g==
UI-OutboundReport: notjunk:1;M01:P0:KEecoTkudzo=;QcmphOroHquxILRtfTRYvT7s/H8
 io5gfQ6tKO9DiaQxx3KFWqxiQn04mBr3RXxVoa2twI/NrBpb/vtAraUMPPDUOrLtLgwbsjn0H
 DrLhONUhYIh11RAMOIY+lmEWbNVjf9H7vEaZp+XkslLtbaZZYuUOF7FarJr2W7ktIDSoQgRjg
 7onLM8aUjg11GrI7cLvZlXc+dpoE7NHLqz06PaS7Agv5e9WuxEia07sJmuwX26G95pRb8xkfw
 Pz5wIUJJjGKycLK+Sk2FB55bn9F18o7OWAdutyN9pLdhvNbvRojGiQzTXttOVYKiLKj1zbDpB
 iaw9NqrrWNo9MrgM+I9BXrVnkuUX7RVgEddwkPlOcIldsekDNPMqGHxle8u9LcrABYFjLB7ao
 DL/pvZFPm8BI4kX9zGuf4Cum4tVkvRsIN0rNH7Xp51GYu/MtVRKGSd58ElKt5OK81WNvdDS32
 t5yALeZJgwIhJCtI/NReAMoy6+2UCiy2PgRzPbc4coim5Q5DT7HnqkEUP8Gpv2PWCMw6NaokV
 A8ZTXs2GRJEA2bp68c0IxVClgygybkHOh//oTCYmkxsee8Syw1C6ODW2vhuiMEQrHm7olB673
 +I6L6ch8jlAs11tI1A5h/eICyjajWpPuDvbLiZjRdljDPtSSNo94u9pAMij2Xyg4tu9e0f/Jl
 sOFt1iO26ozCL2DCOFCc2QmGlSEbvEvNks4T2dVFexlQzOA7wAzXtjsW9hlbtgPInzxYAVews
 5rZzcDCssZATw/ob7DqnN8uJzRvU4/WO8Gu6yxEUIj91mPEB+FYRfrdBhsSfGISZq/jLLHz4J
 TT4YQzcOeYBvXSdEBQEtr1JWcd+fyW7EWbnQEDREtnn0yW2PrkBudf3E3vsbC33cfKmPXrv1k
 isEFymbtV3IadEYQ4TX21wxDhVsxStH31RXauGWutz7pgLGHDxl6X++g1Uq6psc5TdtbOThaj
 EbRB1A==
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Inside function, report_id might get overwritten.
Only REPORT_ID_HIDPP_SHORT is ever passed in.
So there seems to be no point in passing report_id in the first place.
Just directly evaluate which report_id to use in the function itself.


diff --git a/drivers/hid/hid-logitech-hidpp.c
b/drivers/hid/hid-logitech-hidpp.c
index 898691a77a58..20ae7f73ef08 100644
=2D-- a/drivers/hid/hid-logitech-hidpp.c
+++ b/drivers/hid/hid-logitech-hidpp.c
@@ -360,15 +360,16 @@ static int hidpp_send_fap_command_sync(struct
hidpp_device *hidpp,
 }

 static int hidpp_send_rap_command_sync(struct hidpp_device *hidpp_dev,
-	u8 report_id, u8 sub_id, u8 reg_address, u8 *params, int
param_count,
+	u8 sub_id, u8 reg_address, u8 *params, int param_count,
 	struct hidpp_report *response)
 {
 	struct hidpp_report *message;
 	int ret, max_count;
+	u8 report_id;

-	/* Send as long report if short reports are not supported. */
-	if (report_id =3D=3D REPORT_ID_HIDPP_SHORT &&
-	    !(hidpp_dev->supported_reports &
HIDPP_REPORT_SHORT_SUPPORTED))
+	if (hidpp_dev->supported_reports & HIDPP_REPORT_SHORT_SUPPORTED)
+		report_id =3D REPORT_ID_HIDPP_SHORT;
+	else
 		report_id =3D REPORT_ID_HIDPP_LONG;

 	switch (report_id) {
@@ -549,7 +550,6 @@ static int hidpp10_set_register(struct hidpp_device
*hidpp_dev,
 	u8 params[3] =3D { 0 };

 	ret =3D hidpp_send_rap_command_sync(hidpp_dev,
-					  REPORT_ID_HIDPP_SHORT,
 					  HIDPP_GET_REGISTER,
 					  register_address,
 					  NULL, 0, &response);
@@ -562,7 +562,6 @@ static int hidpp10_set_register(struct hidpp_device
*hidpp_dev,
 	params[byte] |=3D value & mask;

 	return hidpp_send_rap_command_sync(hidpp_dev,
-					   REPORT_ID_HIDPP_SHORT,
 					   HIDPP_SET_REGISTER,
 					   register_address,
 					   params, 3, &response);
@@ -658,7 +657,6 @@ static int hidpp10_query_battery_status(struct
hidpp_device *hidpp)
 	int ret, status;

 	ret =3D hidpp_send_rap_command_sync(hidpp,
-					REPORT_ID_HIDPP_SHORT,
 					HIDPP_GET_REGISTER,
 					HIDPP_REG_BATTERY_STATUS,
 					NULL, 0, &response);
@@ -710,7 +708,6 @@ static int hidpp10_query_battery_mileage(struct
hidpp_device *hidpp)
 	int ret, status;

 	ret =3D hidpp_send_rap_command_sync(hidpp,
-					REPORT_ID_HIDPP_SHORT,
 					HIDPP_GET_REGISTER,
 					HIDPP_REG_BATTERY_MILEAGE,
 					NULL, 0, &response);
@@ -782,7 +779,6 @@ static char *hidpp_unifying_get_name(struct
hidpp_device *hidpp_dev)
 	int len;

 	ret =3D hidpp_send_rap_command_sync(hidpp_dev,
-					REPORT_ID_HIDPP_SHORT,
 					HIDPP_GET_LONG_REGISTER,
 					HIDPP_REG_PAIRING_INFORMATION,
 					params, 1, &response);
@@ -816,7 +812,6 @@ static int hidpp_unifying_get_serial(struct
hidpp_device *hidpp, u32 *serial)
 	u8 params[1] =3D { HIDPP_EXTENDED_PAIRING };

 	ret =3D hidpp_send_rap_command_sync(hidpp,
-					REPORT_ID_HIDPP_SHORT,
 					HIDPP_GET_LONG_REGISTER,
 					HIDPP_REG_PAIRING_INFORMATION,
 					params, 1, &response);
@@ -900,7 +895,6 @@ static int hidpp_root_get_protocol_version(struct
hidpp_device *hidpp)
 	int ret;

 	ret =3D hidpp_send_rap_command_sync(hidpp,
-			REPORT_ID_HIDPP_SHORT,
 			HIDPP_PAGE_ROOT_IDX,
 			CMD_ROOT_GET_PROTOCOL_VERSION,
 			ping_data, sizeof(ping_data), &response);
@@ -3180,7 +3174,6 @@ static int m560_send_config_command(struct
hid_device *hdev, bool connected)

 	return hidpp_send_rap_command_sync(
 		hidpp_dev,
-		REPORT_ID_HIDPP_SHORT,
 		M560_SUB_ID,
 		M560_BUTTON_MODE_REGISTER,
 		(u8 *)m560_config_parameter,
@@ -3719,7 +3712,6 @@ static int hidpp_initialize_hires_scroll(struct
hidpp_device *hidpp)
 		struct hidpp_report response;

 		ret =3D hidpp_send_rap_command_sync(hidpp,
-						  REPORT_ID_HIDPP_SHORT,
 						  HIDPP_GET_REGISTER,

HIDPP_ENABLE_FAST_SCROLL,
 						  NULL, 0, &response);

