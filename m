Return-Path: <linux-usb+bounces-5721-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CF5878451CF
	for <lists+linux-usb@lfdr.de>; Thu,  1 Feb 2024 08:13:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6CCDB1F279AB
	for <lists+linux-usb@lfdr.de>; Thu,  1 Feb 2024 07:13:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CE1501586E2;
	Thu,  1 Feb 2024 07:13:43 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from cae.in-ulm.de (cae.in-ulm.de [217.10.14.231])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 890BA157E9B
	for <linux-usb@vger.kernel.org>; Thu,  1 Feb 2024 07:13:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.10.14.231
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706771623; cv=none; b=pau//R+i+Ybsyal0wnQJi3FFxotjqDCCYM32cl+YjT5J2RhiN9Uj+1/jCTNZosUIPlw3RgP3VMb/wCSnOtcs/IKYTMj032LNKiZ8f4UZEJvxaAu8bHME52WU6jo7sQpd4RSMYOIE1h9TwFlJve+TilLc08rc+SoE8Wv+x1k8DsA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706771623; c=relaxed/simple;
	bh=HnpSOysStgYCwaJiJRmOyLwmVi3C39AnAeeqU9/Gi0c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qnBoBulD4nFK0O0YejNTyd197jhAtB1gr9lPMpond1ovDDSwHcGKiXfJD93Xcz5MiP984rpsUNNHbt98mTW+Q3eStusS5BRT+G9sHGLRj97WG9QiiiRxcp8Qlp5EwBbxDxBHckFacDeMqr172MT0VltOheOwQlF8uQwbffxEgiI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=c--e.de; spf=pass smtp.mailfrom=c--e.de; arc=none smtp.client-ip=217.10.14.231
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=c--e.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=c--e.de
Received: by cae.in-ulm.de (Postfix, from userid 1000)
	id DFEF41403E6; Thu,  1 Feb 2024 08:13:31 +0100 (CET)
Date: Thu, 1 Feb 2024 08:13:31 +0100
From: "Christian A. Ehrhardt" <lk@c--e.de>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: linux-usb@vger.kernel.org,
	Harshit Mogalapalli <harshit.m.mogalapalli@oracle.com>
Subject: Re: [bug report] usb: ucsi_acpi: Quirk to ack a connector change ack
 cmd
Message-ID: <ZbtEmyHMBKnPU01A@cae.in-ulm.de>
References: <dbaf3630-6284-4ef6-b471-43c3885e16b0@moroto.mountain>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <dbaf3630-6284-4ef6-b471-43c3885e16b0@moroto.mountain>


Hi Dan,

On Wed, Jan 31, 2024 at 09:59:43AM +0300, Dan Carpenter wrote:
> Hello Christian A. Ehrhardt,
> 
> The patch f3be347ea42d: "usb: ucsi_acpi: Quirk to ack a connector
> change ack cmd" from Jan 21, 2024 (linux-next), leads to the
> following Smatch static checker warning:
> 
> 	drivers/usb/typec/ucsi/ucsi_acpi.c:174 ucsi_dell_sync_write()
> 	warn: missing error code? 'ret'
> 
> drivers/usb/typec/ucsi/ucsi_acpi.c
>     138 static int
>     139 ucsi_dell_sync_write(struct ucsi *ucsi, unsigned int offset,
>     140                      const void *val, size_t val_len)
>     141 {
>     142         struct ucsi_acpi *ua = ucsi_get_drvdata(ucsi);
>     143         u64 cmd = *(u64 *)val, ack = 0;
>     144         int ret;
>     145 
>     146         if (UCSI_COMMAND(cmd) == UCSI_ACK_CC_CI &&
>     147             cmd & UCSI_ACK_CONNECTOR_CHANGE)
>     148                 ack = UCSI_ACK_CC_CI | UCSI_ACK_COMMAND_COMPLETE;
>     149 
>     150         ret = ucsi_acpi_sync_write(ucsi, offset, val, val_len);
>     151         if (ret != 0)
>     152                 return ret;
>     153         if (ack == 0)
>     154                 return ret;
> 
> This would be better as "return 0;"

While it is technically true that this could be written as "return 0;"
it was written in this way intentionally. The ucsi_dell_sync_write
quirk function is a wrapper around this call to ucsi_acpi_sync_write.
These if-statements handle the cases where nothing needs to be done
after that call and we just return with whatever ucsi_acpi_sync_write
returned.

>     155 
>     156         if (!ua->dell_quirk_probed) {
>     157                 ua->dell_quirk_probed = true;
>     158 
>     159                 cmd = UCSI_GET_CAPABILITY;
>     160                 ret = ucsi_acpi_sync_write(ucsi, UCSI_CONTROL, &cmd,
>     161                                            sizeof(cmd));
>     162                 if (ret == 0)
>     163                         return ucsi_acpi_sync_write(ucsi, UCSI_CONTROL,
>     164                                                     &ack, sizeof(ack));
>     165                 if (ret != -ETIMEDOUT)
>     166                         return ret;
>     167 
>     168                 ua->dell_quirk_active = true;
> 
> Here we set ->dell_quirk_active to true;
> 
>     169                 dev_err(ua->dev, "Firmware bug: Additional ACK required after ACKing a connector change.\n");
>     170                 dev_err(ua->dev, "Firmware bug: Enabling workaround\n");
>     171         }
>     172 
>     173         if (!ua->dell_quirk_active)
> --> 174                 return ret;
> 
> So this is basically an else statement and ret is zero.  Smatch thinks
> it should be an error code but I think it's intentional.  Why reverse
> the if statement, return a literal, and pull the code in a tab.  You
> could delete the ua->dell_quirk_active variable.  Or is the concern
> here that we'll be probing two of these quirky things concurrently?
> It's a bit strange and probably needs some cleanup or comments.
> 
> 	if (ua->dell_quirk_probed)
> 		return 0;

This is not correct. ->dell_quirk_active may have been set in a
previous run and that's the whole point of the probe: Setting
->dell_quirk_active to the correct value for future calls to this
function.

> 	ua->dell_quirk_probed = true;
> 
> 	cmd = UCSI_GET_CAPABILITY;
> 	ret = ucsi_acpi_sync_write(ucsi, UCSI_CONTROL, &cmd, sizeof(cmd));
> 	...

So this code should only be executed once.

> 
>     175 
>     176         return ucsi_acpi_sync_write(ucsi, UCSI_CONTROL, &ack, sizeof(ack));
>     177 }

This additional call is the actual quirk. It should not be neccessary
according to the spec but if the probe determines that it is required
it must be done each time an ack for an async event is sent. If the
quirk is not neccessary we just return whatever the above call to
ucsi_acpi_sync_write() returned.

So in summary, I don't think there's a bug here.

However, it is possible to silence smatch with the diff below
(or with the second hunk alone) and I'd be ok with this. I can
give this a try on the real hardware and send a patch later this
week.

     regards   Christian


diff --git a/drivers/usb/typec/ucsi/ucsi_acpi.c b/drivers/usb/typec/ucsi/ucsi_acpi.c
index 928eacbeb21a..99fbc7ae0f1e 100644
--- a/drivers/usb/typec/ucsi/ucsi_acpi.c
+++ b/drivers/usb/typec/ucsi/ucsi_acpi.c
@@ -151,7 +151,7 @@ ucsi_dell_sync_write(struct ucsi *ucsi, unsigned int offset,
 	if (ret != 0)
 		return ret;
 	if (ack == 0)
-		return ret;
+		return 0;
 
 	if (!ua->dell_quirk_probed) {
 		ua->dell_quirk_probed = true;
@@ -171,7 +171,7 @@ ucsi_dell_sync_write(struct ucsi *ucsi, unsigned int offset,
 	}
 
 	if (!ua->dell_quirk_active)
-		return ret;
+		return 0;
 
 	return ucsi_acpi_sync_write(ucsi, UCSI_CONTROL, &ack, sizeof(ack));
 }


