Return-Path: <linux-usb+bounces-35396-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yBbUFZiVwmkXfAQAu9opvQ
	(envelope-from <linux-usb+bounces-35396-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Tue, 24 Mar 2026 14:46:00 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id C527C309A88
	for <lists+linux-usb@lfdr.de>; Tue, 24 Mar 2026 14:45:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 1E2123078F8B
	for <lists+linux-usb@lfdr.de>; Tue, 24 Mar 2026 13:40:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 71EC137BE7F;
	Tue, 24 Mar 2026 13:40:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="bGV68UCs"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com [209.85.222.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C41BB364044
	for <linux-usb@vger.kernel.org>; Tue, 24 Mar 2026 13:40:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774359606; cv=none; b=JiLZy2h2o8WG4PChtdCTr5vbWgZU+As1vCoW+iSnf2v4dUaU8lPkNQrA73mzN6Zb/o0odcn7jehN8Q6ohiiJT4voBLrrMAQX/jXqzBOe0r6LSIgmt2cEAv9yuI8wrINDK3mvshBvK0TSlPrlhlWzNnksEvlsbK/j12/yfrLBci4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774359606; c=relaxed/simple;
	bh=gB9UGxCWxD/PtBMHenHcj06EGocK8eI8EN2Vt90PtuE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gMrCs61Ntcwqlj20pbOutg8CTyONW/slfmRPscPnlhxFCmNgLrgKEv/O3B1gYU8+z+koVH90Fo7NvoOp9Fq0LeYDu4DLv7MyAh3qSd9PraoIxvv7EZY2TQrx9BIZReMN19Xa0FVH3V6T/1iNNX0uDxJIrtbkWuO1XF5zaAsgYog=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=bGV68UCs; arc=none smtp.client-ip=209.85.222.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Received: by mail-qk1-f179.google.com with SMTP id af79cd13be357-8cd7c372929so469311285a.0
        for <linux-usb@vger.kernel.org>; Tue, 24 Mar 2026 06:40:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1774359604; x=1774964404; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=s8FPgOYJRQg2TdSQ65IcaLDL29XA7DW6gJZHjee2pCc=;
        b=bGV68UCsFF4FxRtVW/vq1xVoHoWI8wwM81iNK/x0W7LnjtdStUC9tWPUxSdx9Fifbj
         evBnsEItgui46b0YA0p+Ot+HJzC3qQFPMi4ISsfgcPZNdnn6JibogN+NqhhAxTELOYhT
         005ldLSoFwG7tBVf6VhH65pp55bo2o3QDfAtRft7JVe+bS6paoGA/WYZXfkDELJBmCte
         xtxlkTG47zUGBmLbytUvI/GEag5RfDAQ9rzoIz73ZaHCGG73HTJyXKpeGY/cNsf2L6F/
         Zvy9/Our6dpdxwuPos76S5hYZgZhbjs7wrGJuO/4X/q1ulSpmvCc3oCMt72DCehMWbRG
         IOHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774359604; x=1774964404;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=s8FPgOYJRQg2TdSQ65IcaLDL29XA7DW6gJZHjee2pCc=;
        b=rqCxnmeKSpKshUUU+Ymo1/R8ymAcxckIfY5XDzsqHxF3WpW2zSOOFQNRL3j68lGut2
         C6LJ1HtEHfjF8ySNVPfUtf27eBIM+s6WNKyObTq75gWjGpvRPmEDyORFcP5P2WgCpzh0
         rqh67Z35vaGKXi6E2rR2FLcInglPjsd6naLcX8l3V5ImUhc3tFadCWF1Gf2uF/N7Meu8
         73K721lsq12ZLF5hXV8yX8Y6vu8kwVOEPaHkSgYW3p8VOZFIzQWDTIwWCly1pDmH2ysV
         Ra0k6wyDmmkP4D7+JFKc63B+2pMIr+axoobmnKfNapAk5xZxsEXy64LiNTdeHavYGLag
         4rng==
X-Gm-Message-State: AOJu0YxOA9v5zBb0N0YQH3+pgGTo1LcPm8aBwW6Y//JuDiDAcfszNK8m
	6r9O9E1MA0CbCeoMU2oWryTOpC2Ay21OtFGmlPPibC82wcCNo7CbpjQA60uWS4ANs7HmjqyJIMv
	GnEc23g==
X-Gm-Gg: ATEYQzxuqFLwZCtJlPgNvDgE/MMcvbci5uct0vdozCCaO8gJzJUHJtPnm3Z9eXMd2qA
	7ZrWbf2+SVvo1dplpja3bh52yoZIjSxdI8H8L8g+dEE6JGVXjjmshGwAVy23keOauABczV7R8lw
	mahAJajZGdsQNnpgBydC6NVsBWl/8Nko//L2JU3dzh5wtlu0GYj26DRWmPvMvuxkXsnrD1zSFMy
	d0p1pLJXIEQ0Lqodx+TGyUOEfOaoaaaBZQ5AMCdLv267SrSjL2tnXCv/3MW5EaedJzsO+SI9V4d
	XD2fwlyzJJAnxCRXXdE2aJvNixGprn1xh3zvjvcawwoTQRTBsZ91YXwWBT+P7Hf4cs19GvgNaQS
	tuVwVfg7aRmXsCymCbzg/gV3BEzjkhTjYZPe5ghGHrTWFWnqq8Qqvcht+F3dUUxgexZ4mNyC6NN
	hvcCLp9ymjDEUZsA25m3L7S7rH
X-Received: by 2002:a05:620a:28d5:b0:8cf:e0fe:f21b with SMTP id af79cd13be357-8cfe0ff1025mr1325658785a.16.1774359603620;
        Tue, 24 Mar 2026 06:40:03 -0700 (PDT)
Received: from rowland.harvard.edu ([2601:19b:d01:d210::9c76])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8cfc90ba89fsm1046907285a.40.2026.03.24.06.40.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Mar 2026 06:40:03 -0700 (PDT)
Date: Tue, 24 Mar 2026 09:40:00 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Oliver Neukum <oneukum@suse.com>
Cc: USB list <linux-usb@vger.kernel.org>,
	"linux-input@vger.kernel.org" <linux-input@vger.kernel.org>
Subject: Re: Question regarding error handling in usbhid
Message-ID: <5ed78115-abbb-4ca7-ab07-2280019f6ab5@rowland.harvard.edu>
References: <8d665258-6dd6-404a-85e0-a2f3420cd992@suse.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8d665258-6dd6-404a-85e0-a2f3420cd992@suse.com>
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[rowland.harvard.edu,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[rowland.harvard.edu:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-35396-lists,linux-usb=lfdr.de];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[rowland.harvard.edu:+];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[stern@rowland.harvard.edu,linux-usb@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-usb];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,rowland.harvard.edu:dkim,rowland.harvard.edu:mid]
X-Rspamd-Queue-Id: C527C309A88
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, Mar 24, 2026 at 10:57:16AM +0100, Oliver Neukum wrote:
> Hi,
> 
> hid_io_error(), in case it decides that a reset is necessary,
> schedules reset_work(). reset_work() in turn calls usb_queue_reset_device().
> Why? Is there a reason usb_queue_reset_device() is not used directly
> in hid_io_error()?

This is partly explained in the changelog for commit 8f507ef522d5 ("HID: 
usbhid: improve handling of Clear-Halt and reset"):

    The way resets are carried out is also changed.  Now the driver will
    call usb_queue_reset_device() instead of calling usb_reset_device()
    directly.  This avoids a deadlock that would arise when a device is
    unplugged: The hid_reset() routine runs as a workqueue item, a reset
    attempt after the device has been unplugged will fail, failure will
    cause usbhid to be unbound, and the disconnect routine will try to do
    cancel_work_sync().  The usb_queue_reset_device() implementation is
    carefully written to handle scenarios like this one properly.

The other part of the explanation is that the reset code was added to 
hid_io_error() before usb_queue_reset_device() existed (2006 vs 2008).

Alan Stern

