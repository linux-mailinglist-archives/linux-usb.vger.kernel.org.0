Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4C81A6CF7AC
	for <lists+linux-usb@lfdr.de>; Thu, 30 Mar 2023 01:48:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229703AbjC2Xsb (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 29 Mar 2023 19:48:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50702 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229694AbjC2Xsa (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 29 Mar 2023 19:48:30 -0400
Received: from lithium.sammserver.com (lithium.sammserver.com [168.119.122.30])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B34F3619F
        for <linux-usb@vger.kernel.org>; Wed, 29 Mar 2023 16:48:20 -0700 (PDT)
Received: from mail.sammserver.com (sammserver.wg [10.32.40.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (Client did not present a certificate)
        by lithium.sammserver.com (Postfix) with ESMTPS id 7DF7231181F0;
        Thu, 30 Mar 2023 01:48:18 +0200 (CEST)
Received: from mail.sammserver.com (localhost.localdomain [127.0.0.1])
        by mail.sammserver.com (Postfix) with ESMTP id 268C03FC17;
        Thu, 30 Mar 2023 01:48:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cavoj.net; s=email;
        t=1680133698; bh=4nx/mUebxFTclN2YfVXpJTIdYwhnY3SUJoo1qRsGrQg=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=KTjUyIFwxxqKEv4H3kiVWA94y/bmm5roeTaRdY9Twy1fQ7RFqrmwLLYS+Xp1TqHUt
         WqHHAkg7KA5ykFpgNX5zliHdVqLHlROtD2igdDLfJkhR26sjFjj2jhzuhcRdrQ65Ik
         ZXlNj/GHKfTjM9W64U6tngRQbLZVfEY6tlnIRaOs=
MIME-Version: 1.0
Date:   Thu, 30 Mar 2023 01:48:18 +0200
From:   =?UTF-8?Q?Samuel_=C4=8Cavoj?= <samuel@cavoj.net>
To:     Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc:     Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        linux-usb@vger.kernel.org
Subject: Re: [PATCH] usb: typec: ucsi: introduce read_explicit operation
In-Reply-To: <c5223adc99dd9bf849071e8fdfed4bb1@cavoj.net>
References: <20230120233920.752245-1-samuel@cavoj.net>
 <Y8uRnc3Cxb1ADad6@kroah.com> <Y8+/Lgp7fWaxFsri@kuha.fi.intel.com>
 <ZAi1KO+WUs+9nNOn@kuha.fi.intel.com> <ZBMUsweZjfqxZJdc@kuha.fi.intel.com>
 <c5223adc99dd9bf849071e8fdfed4bb1@cavoj.net>
Message-ID: <3ae633095973c747baea1a23f3b7f6f4@cavoj.net>
X-Sender: samuel@cavoj.net
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Heikki,

On 2023-03-18 03:04, Samuel Čavoj wrote:
...
>> Unfortunately nothing seems to work... I'm attaching the DMI quirk
>> patch here. Can you test it?
> 
> I'll definitely try it out, I hope sometime next week!
> 
>> I'm not sure if the DMI_PRODUCT_NAME is just "ZenBook" so you may
>> need to fix that in the patch!!
>> 
>> You can get the correct value by running dmidecode. This should work:
>> 
>>         % dmidecode -s system-product-name

This returns "ZenBook UX325UA_UM325UA", so the DMI_MATCH would work.
However my DMI_SYS_VENDOR is "ASUSTeK COMPUTER INC.", uppercase.

All in all, the patch works after some modifications which I'm
attaching below. In summary:

  - The DMI_MATCH SYS_VENDOR was changed to uppercase
  - The DMI_MATCH PRODUCT_NAME was changed to be more specific, although
    I'm not sure what the best value is here.
  - The conditional in ucsi_zenbook_read was fixed.
  - ua->cmd cannot be reset to 0 after read because the reset
    procedure repeatedly calls read without performing
    any other commands. I don't think this should cause any problems
  - ucsi_acpi_notify needs to call the quirked variant
    as well, so I put an indirect call there.

Otherwise maybe ucsi_acpi_async_write should only set cmd if the offset
is UCSI_CONTROL.

I'm occasionally getting some other errors later on, but I think
those might be specific to a certain cheap USB-C hub I have. They
don't occur with it unplugged.

Thanks,
Sam

diff --git a/drivers/usb/typec/ucsi/ucsi_acpi.c 
b/drivers/usb/typec/ucsi/ucsi_acpi.c
index a5cb4b89573f..3b872cb3808b 100644
--- a/drivers/usb/typec/ucsi/ucsi_acpi.c
+++ b/drivers/usb/typec/ucsi/ucsi_acpi.c
@@ -102,14 +102,13 @@ ucsi_zenbook_read(struct ucsi *ucsi, unsigned int 
offset, void *val, size_t val_
  	struct ucsi_acpi *ua = ucsi_get_drvdata(ucsi);
  	int ret;

-	if (ua->cmd & (UCSI_VERSION | UCSI_PPM_RESET)) {
+	if (offset == UCSI_VERSION || UCSI_COMMAND(ua->cmd) == UCSI_PPM_RESET) 
{
  		ret = ucsi_acpi_dsm(ua, UCSI_DSM_FUNC_READ);
  		if (ret)
  			return ret;
  	}

  	memcpy(val, ua->base + offset, val_len);
-	ua->cmd = 0;

  	return 0;
  }
@@ -123,8 +122,8 @@ static const struct ucsi_operations ucsi_zenbook_ops 
= {
  static const struct dmi_system_id zenbook_dmi_id[] = {
  	{
  		.matches = {
-			DMI_MATCH(DMI_SYS_VENDOR, "ASUSTeK Computer Inc."),
-			DMI_MATCH(DMI_PRODUCT_NAME, "ZenBook"),
+			DMI_MATCH(DMI_SYS_VENDOR, "ASUSTeK COMPUTER INC."),
+			DMI_MATCH(DMI_PRODUCT_NAME, "ZenBook UX325UA_UM325UA"),
  		},
  	},
  	{ }
@@ -136,7 +135,7 @@ static void ucsi_acpi_notify(acpi_handle handle, u32 
event, void *data)
  	u32 cci;
  	int ret;

-	ret = ucsi_acpi_read(ua->ucsi, UCSI_CCI, &cci, sizeof(cci));
+	ret = ua->ucsi->ops->read(ua->ucsi, UCSI_CCI, &cci, sizeof(cci));
  	if (ret)
  		return;

-- 
2.40.0
