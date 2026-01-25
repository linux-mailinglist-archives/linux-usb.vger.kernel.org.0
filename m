Return-Path: <linux-usb+bounces-32685-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2EikNVCUdWnOGQEAu9opvQ
	(envelope-from <linux-usb+bounces-32685-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Sun, 25 Jan 2026 04:56:00 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F5567FB5C
	for <lists+linux-usb@lfdr.de>; Sun, 25 Jan 2026 04:56:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 31153300E3EC
	for <lists+linux-usb@lfdr.de>; Sun, 25 Jan 2026 03:55:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6239620ADD6;
	Sun, 25 Jan 2026 03:55:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="j+2xjZh3"
X-Original-To: linux-usb@vger.kernel.org
Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67C9D335BA
	for <linux-usb@vger.kernel.org>; Sun, 25 Jan 2026 03:55:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.2
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769313343; cv=none; b=iCsTLS53pS3K4T5sBY1JnYVCGHqGxpVH6k4ApLhz8UW6wEBsPhhZqLt55a+ghbHnf0UR1b6aE5tiZFQkFHhc28mAE1r3v+jC+Gq/jSGAX2gKATFBn7UUteKHjET1XhmY9OZRBwHJi7vnjYfdmljvcJOqhoMCDeyTgGX3hLSEwhg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769313343; c=relaxed/simple;
	bh=2EK/99tnhoJPwZWykPvIRo9yQdf+uh7siJxUbxl8sL4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=cNL4bqBrdTO2aOHfSIESLGMgM0GWf3rO37UAUDfszu5aV2eXqCFq4v5DAkWr559bfzcDpU+6CC+M/7o0sZBFitfoS1uKSCsKnsAw7kMooE2AOpcLB7GWvSi+mmI5kv4vOJ0O0bClNlOvb5DtgryxTGVh2I4zBftXH5FgetaOawA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=j+2xjZh3; arc=none smtp.client-ip=220.197.31.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version:
	Content-Type; bh=HEQoTVx2pH3/SgY9C1Cshp2d6Hp+K0/Moy6fj6JTPyo=;
	b=j+2xjZh3wv7BYIXIaU8qNjM44fHiJQ6yImn1Zzk+jT2xAG8S9UV7hTuBh/TuoG
	6X84rCWIm+oeYCXAPg9dDGzKojZwEfhIOzBugGhSj0D2bQIxlvMs3FpPzp1PJuvr
	P98M5pir82Z5U2mg5yqUH+ceyySDDZwFwurlWYXA6+QSo=
Received: from ProDesk-480.. (unknown [])
	by gzga-smtp-mtada-g0-1 (Coremail) with SMTP id _____wDXGRURlHVpAv2qHQ--.33551S2;
	Sun, 25 Jan 2026 11:55:01 +0800 (CST)
From: Andy Yan <andyshrk@163.com>
To: heikki.krogerus@linux.intel.com
Cc: gregkh@linuxfoundation.org,
	linux-usb@vger.kernel.org,
	linux@roeck-us.net
Subject: Re: [PATCH 2/15] usb: typec: Add parameter for the VDO to typec_altmode_enter()
Date: Sun, 25 Jan 2026 11:54:22 +0800
Message-ID: <20260125035457.354349-1-andyshrk@163.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20191230142611.24921-3-heikki.krogerus@linux.intel.com>
References: <20191230142611.24921-3-heikki.krogerus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=all
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wDXGRURlHVpAv2qHQ--.33551S2
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxU54SrUUUUU
X-CM-SenderInfo: 5dqg52xkunqiywtou0bp/xtbC7hXhQGl1lBUKaAAA3l
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.16 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[163.com,none];
	R_DKIM_ALLOW(-0.20)[163.com:s=s110527];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andyshrk@163.com,linux-usb@vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-32685-lists,linux-usb=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[163.com];
	TAGGED_RCPT(0.00)[linux-usb];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_NONE(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	DKIM_TRACE(0.00)[163.com:+]
X-Rspamd-Queue-Id: 1F5567FB5C
X-Rspamd-Action: no action

Hello Heikki:

>Enter Mode Command may contain one VDO.

>Signed-off-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
>---
> drivers/usb/typec/altmodes/displayport.c | 5 +++--
> drivers/usb/typec/bus.c                  | 8 +++++---
> drivers/usb/typec/tcpm/tcpm.c            | 6 +++---
> drivers/usb/typec/ucsi/displayport.c     | 2 +-
> include/linux/usb/typec_altmode.h        | 4 ++--
> 5 files changed, 14 insertions(+), 11 deletions(-)

>diff --git a/drivers/usb/typec/altmodes/displayport.c b/drivers/usb/typec/altmodes/displayport.c
>index 4092248a5936..0edfb89e04a8 100644
>--- a/drivers/usb/typec/altmodes/displayport.c
>+++ b/drivers/usb/typec/altmodes/displayport.c
>@@ -188,7 +188,7 @@ static void dp_altmode_work(struct work_struct *work)
> 
> 	switch (dp->state) {
> 	case DP_STATE_ENTER:
>-		ret = typec_altmode_enter(dp->alt);
>+		ret = typec_altmode_enter(dp->alt, NULL);
 		if (ret)
 			dev_err(&dp->alt->dev, "failed to enter mode\n");
 		break;
.......
> diff --git a/drivers/usb/typec/tcpm/tcpm.c b/drivers/usb/typec/tcpm/tcpm.c
> index 56fc356bc55c..f3087ef8265c 100644
> --- a/drivers/usb/typec/tcpm/tcpm.c
> +++ b/drivers/usb/typec/tcpm/tcpm.c
> @@ -1475,16 +1475,16 @@ static int tcpm_validate_caps(struct tcpm_port *port, const u32 *pdo,
>  	return 0;
>  }
>  
> -static int tcpm_altmode_enter(struct typec_altmode *altmode)
> +static int tcpm_altmode_enter(struct typec_altmode *altmode, u32 *vdo)
>  {
>  	struct tcpm_port *port = typec_altmode_get_drvdata(altmode);
>  	u32 header;
>  
>  	mutex_lock(&port->lock);
> -	header = VDO(altmode->svid, 1, CMD_ENTER_MODE);
> +	header = VDO(altmode->svid, vdo ? 2 : 1, CMD_ENTER_MODE);
>  	header |= VDO_OPOS(altmode->mode);

Sorry to bother you. I happened to come across this piece of code and
I'm not quite clear about this part: vdo ? 2 : 1

According to the definition of the VDO macro(pd_vdo.h), the type here is
only 1 bit wide, located at bit 15. If the type value is set to 2 here,
wouldn’t that overwrite bit 16?

/*
 * VDM header
 * ----------
 * <31:16>  :: SVID
 * <15>     :: VDM type ( 1b == structured, 0b == unstructured )
 * <14:13>  :: Structured VDM version
 * <12:11>  :: reserved
 * <10:8>   :: object position (1-7 valid ... used for enter/exit mode only)
 * <7:6>    :: command type (SVDM only?)
 * <5>      :: reserved (SVDM), command type (UVDM)
 * <4:0>    :: command
 */
#define VDO(vid, type, ver, custom)			\
	(((vid) << 16) |				\
	 ((type) << 15) |				\
	 ((ver) << 13) |				\
	 ((custom) & 0x7FFF))


>-	tcpm_queue_vdm(port, header, NULL, 0);
>+	tcpm_queue_vdm(port, header, vdo, vdo ? 1 : 0);
> 	mod_delayed_work(port->wq, &port->vdm_state_machine, 0);


