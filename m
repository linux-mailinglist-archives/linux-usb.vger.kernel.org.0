Return-Path: <linux-usb+bounces-37143-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cJonI7wJ/mlhmQAAu9opvQ
	(envelope-from <linux-usb+bounces-37143-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Fri, 08 May 2026 18:05:16 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 91F654F92EA
	for <lists+linux-usb@lfdr.de>; Fri, 08 May 2026 18:05:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 4970C300462D
	for <lists+linux-usb@lfdr.de>; Fri,  8 May 2026 16:04:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DBE303D6692;
	Fri,  8 May 2026 16:04:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IQT1ykXJ"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 270CB3D1CA8
	for <linux-usb@vger.kernel.org>; Fri,  8 May 2026 16:04:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778256294; cv=none; b=jLOKFicw/cRAfQGyCUqlkiLj4z0NsUPy5USSL0IiOWAQUAM3MzsaC+9H5ccFX53B4/79t1KSbDF5qaby9DDHqycE+YjaHCEnSaKyPgrLP8WqzLRDvR6E+3Lc6YGGTIwCUzpChlvY4H6f6jstB9hTkgYdVsnmYpCpIqmth/33ZbQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778256294; c=relaxed/simple;
	bh=cX+mME8r0BfrH9qUIlp1d8D8d65znefW7jh2nQwbSyQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LD6a+0CdzAbR3rqq08fkMPROpUXxcChrI0EbrBOJVv2OaxmynQeesRcSBfYHaFD5tl/gKAi1mVJGMp5Hw6+LS8pAdoCGs6EILI4vhgKwnpJhHUgS2Q2P4mi+nptYnF+GvSZRMGatcgISggn3RMAsrS3dliyp+QMg3CxNoU41YnU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IQT1ykXJ; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-488b3f8fa2bso31876275e9.1
        for <linux-usb@vger.kernel.org>; Fri, 08 May 2026 09:04:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778256291; x=1778861091; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=HzwP3Am9cix1EHyX+t1xAlzk+rVx5IRrzJL77MoWOuI=;
        b=IQT1ykXJ+aGcbsKprTTc3mg1BY7PyanioSd+STeR4cJREt4sHHwCf8k29pfGWAToCp
         Wb4Kc0yEf5OzSJHzXPe1etFD8kwLvbNiHTf9QKWPo5a2AVEMBntc7+cGc6hWywr+YAgD
         T1/N8q2B2ycVOAABCEIZvXvLi/fVRNhYExhNiOk5aVRIIdV24K28m96vwu20vhrxUYkn
         eQMCcqOmfu+fFDqq+2E6ZpXH5caR/PTTPT821ExQjHSBaXzCrSwd3IaOo/9WSEJkvyZE
         jVevcJoVedoOMdIxBSPR4arpF9FhqOxP1UFT9S5sov9PUBYI5GzmbFX9rUCJ1XIhgVVf
         l4Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778256291; x=1778861091;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HzwP3Am9cix1EHyX+t1xAlzk+rVx5IRrzJL77MoWOuI=;
        b=NfT1dunr/J4ZbflPXG9qLnY/Pq1rgiTK8pESJDPPfXyGyd22jSfdCWNhsqQEdyXecO
         65rsKvtQZU2nyrRbMff1fcrwP2dpa+5BEeLYly+K+9iQVtwcsDfT580JIMviORzlhjzJ
         yqZWuOb1OFR8XKTLT6WJmtsQrAnWKoVdFk2tuGV3SCYhLwvjSvyZmfA8QDlmA165T22A
         tkheDuL58Z2vPMFBvRZHuEXKpUrLfNFi7/0kxnTgfUc6osHrXQ4EzFPqZwYqBys/RYeV
         I3l2WAkn6ENgj+4aUhXop7x2GG9Mdux2K2qn4sao5eR/pR4XTomTf8HDCaTSc1xGdaAP
         iAsQ==
X-Forwarded-Encrypted: i=1; AFNElJ8apQf50UKPhCW0I1gY4ONEwBxwtBbc6byJ0dV2WCaYi2Tfswp/syrSexUFfEAL6h7p0EdfZFel8eA=@vger.kernel.org
X-Gm-Message-State: AOJu0YxilLYq1a34OJEw1toidnwhrzfoIE089V5vRN1GYGbEfvkaaVNF
	MPzAsarerBlb1kdhv1hU9fv6TXQsjALInZKuEO2i8vH3Jlb0HeqM8isC+YWJyhUk
X-Gm-Gg: AeBDieuRi75DkVAhCVm6GE0k1BQIHH4tWBG7tgNWO/+U+BRR6ytwatp3Y6F1zSqAbi0
	2jss0unI8Hb1/JX0SB+qtbn00H9iGXrXgd4wtqMQYBxJayJASZDjdVUrlXdWpdBFf4m5SAgtdyI
	GQlu9FliTp7b0TQHu8Gzf6IXlxm5hw3s29q/5bwfYIqgcDQB0gOag0BQmlRlTJtHzhqLXAbvlGQ
	WxmGQ1Awi+/9UUMKMYLAX41VFnUNch+nGxhzJ9CakRXTPNRTyHWu0gsqhSemdj5zPC2ndooaX2K
	/6mpXbWaIg/Gomlu2Q+iobOPHqR94ZOSosQ4eoFaOvGVy9wtrI1kJorGu0mC3mpBNuTI/RMKx0m
	QXwD0/1Pm4ad9ZUcYNlIOyIals4SXSCgN5Jk9abnB2GWFs2rIXqZE9PmDLT6KPXi7SSGVPJS2vP
	d6QoV7HYaYrENsGPOC2znvQ9xWctSyYqMu6UBqWcPA4Mq+6YF07bdhjmAsn5dnTtHCts7IcPfNU
	a/5nqKwmNBeyQgX3PSKcpn7I7/AEGo/oPpYoiAX3YtQU9el9mgGf8veunHansp8JVpl9qNJNw==
X-Received: by 2002:a05:600c:32af:b0:48a:534a:eed8 with SMTP id 5b1f17b1804b1-48e5dfcd722mr75004745e9.1.1778256291123;
        Fri, 08 May 2026 09:04:51 -0700 (PDT)
Received: from franzs-nb (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch. [83.173.201.248])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48e6dd35abcsm4248055e9.7.2026.05.08.09.04.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 May 2026 09:04:50 -0700 (PDT)
Date: Fri, 8 May 2026 18:04:49 +0200
From: Franz Schnyder <fra.schnyder@gmail.com>
To: Xu Yang <xu.yang_2@nxp.com>
Cc: Thinh.Nguyen@synopsys.com, gregkh@linuxfoundation.org, 
	shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de, 
	festevam@gmail.com, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, jun.li@nxp.com, 
	Francesco Dolcini <francesco@dolcini.it>
Subject: Re: [PATCH v3 3/3] usb: dwc3: imx8mp: disable auto suspend for host
 role
Message-ID: <hsyy2owzbt7tsljktlrz5g4bnrnecznvcyy6zxt7gfyxb4xvgi@ysko6xe6h2zm>
References: <20260108081433.2119328-1-xu.yang_2@nxp.com>
 <20260108081433.2119328-3-xu.yang_2@nxp.com>
 <k2sxmwhrv3tivustfnpz54ehuufkcrcruu2uuukuyugqtqljzl@5roxndm5fn5u>
 <jjwlrgusucoacaye75uqfuh76a4jhdv3ivzjuemgusw3trwseb@mymuy62cptxp>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <jjwlrgusucoacaye75uqfuh76a4jhdv3ivzjuemgusw3trwseb@mymuy62cptxp>
X-Rspamd-Queue-Id: 91F654F92EA
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-37143-lists,linux-usb=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[synopsys.com,linuxfoundation.org,kernel.org,pengutronix.de,gmail.com,vger.kernel.org,lists.linux.dev,lists.infradead.org,nxp.com,dolcini.it];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[13];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[fraschnyder@gmail.com,linux-usb@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Action: no action

Hi Xu,

On Fri, May 08, 2026 at 06:54:40PM +0800, Xu Yang wrote:
> It's strange that link->status is not DL_STATE_DORMANT or DL_STATE_NONE at
> the time which means the device core may not properly unbind consumer devices
> or handle something. The patch does a simple thing so the issue may not come
> from the patch itself.
> 
> 1639:	list_for_each_entry_safe_reverse(link, ln, &dev->links.consumers, s_node) {
> 1640:		WARN_ON(link->status != DL_STATE_DORMANT &&
> 1641:			link->status != DL_STATE_NONE);
> 1642:		__device_link_del(&link->kref);
> 1643:	}
> 
> Which kernel and dtb are you using? If it's a downstream repo, how do the USB
> controller and related DTS nodes look like?

I was using kernel version 7.1-rc2 and noticed it while working on 
sending the Aquila iMX95 upstream.
https://lore.kernel.org/all/20260506-add-aquila-imx95-v1-2-69c8ee1c5413@toradex.com/
> 
> Does the issue easily happen? Does dwc3_imx8mp_probe() eventually succeed?

I did various boot attempts with the commit reverted and couldn't 
reproduce the issue. With the commit I ran into the issue in about one 
third of all boot attempts. So most of the time dwc3_imx8mp_prove 
actually succeeds.

> 
> Could you add "#define DEBUG" in the head of drivers/base/core.c, rerun and share the log?
>
I can provide you with the data next week.
 
> Yes, if you use the new driver, I think this issue won't happen at all.
> 
So once your work is merged in the imx95.dtsi we should be fine.

> Thanks,
> Xu Yang

Best regards,

Franz

