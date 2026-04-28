Return-Path: <linux-usb+bounces-36654-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WH55MsAb8WnadQEAu9opvQ
	(envelope-from <linux-usb+bounces-36654-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Tue, 28 Apr 2026 22:42:40 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 2645F48BDC1
	for <lists+linux-usb@lfdr.de>; Tue, 28 Apr 2026 22:42:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7CB3B30530FF
	for <lists+linux-usb@lfdr.de>; Tue, 28 Apr 2026 20:38:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9CD5723183F;
	Tue, 28 Apr 2026 20:38:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="CC4f6Eg+"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com [209.85.222.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91A9E31159C
	for <linux-usb@vger.kernel.org>; Tue, 28 Apr 2026 20:38:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777408703; cv=none; b=a3+4gqy7XyLuHJTcLLn7A91h3O6/4qJdtd3W05huo0sT/lUGQzSJmKIItEgZFVyyIZ/IKMU7HCfxnICZcQ/E7RBO8W9Mc3HEGpikWM6h66ppllFysQa2VMFHKGptW9XPXmIC86E4/5L8m9OSAppW5tnHd4Oy74cNZ+GTbASHoj4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777408703; c=relaxed/simple;
	bh=PLm8HvIuRP+sC7+5mYb8rCSDMc0vUva0sF2srHPvaMo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Z2FOOPBEkYJZM40ua/14bKMo0NOTRiVwKGbzs2J6rfUf4vTYKYvJ+cruRSvuc5ESl7/KndVaUGe6Xf7eF5WuYKWZSohowU9GgU9Y8DtulQ02cr4OOf2qDMX66zQzUwCYPLtMrrqZSXDVZYXy25PrV6bxH36geHIvyuWFUTc3moU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=CC4f6Eg+; arc=none smtp.client-ip=209.85.222.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Received: by mail-qk1-f175.google.com with SMTP id af79cd13be357-8f83efb5729so105668285a.1
        for <linux-usb@vger.kernel.org>; Tue, 28 Apr 2026 13:38:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1777408700; x=1778013500; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=2tmObnwIqYHu8vtJ+vQD/1VUWApOg/kryyeMtEO0Rzs=;
        b=CC4f6Eg+4NMUmANrBhWL/1ryk3wsHzRbapCxVVUfJpTiRM5RbxKsu898dAy3dDTdSF
         ig6TXCH9E7ULgxYM9ffxes0En8fxTsgxgkrldFOgMhkPNjxf0iVeRVvxOXByjHhRnbyc
         nDeltRA5YajgjRJtZ6VdaV8C4TeKeaGD3kHXQmzfCQCvlRCIuVpG3Dd4qWmVaLw/J3mR
         uhFH3oDiHCSrAuj3JVnpxVUm+QcHjwIDZ39UhVgBmX1j6eD6G6/k9hZ/m3n/XiY+l85D
         9tA4XvnU0tX9nlQgglKwPe2Khe1Xl3MObceypHFFG6A9m/Bn8ZdkweBtOqaMC+idyMBQ
         F0oQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777408700; x=1778013500;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2tmObnwIqYHu8vtJ+vQD/1VUWApOg/kryyeMtEO0Rzs=;
        b=AlsBbucb3z+xuXmOD3m0WYEpXZnZ4ZVPkIuLSMrkS9TrzPWmsuLDPXtO5bA/uwWmJ/
         Ba1X1x7UqJkArwQMnhjcxpvjNW/uAqI0lihhH7HV/bQb6YwmExduUVd1+tiSlO7+2GcF
         MlVhci81K0jSuko8LHSBw9xribS7tVjv3ZMpq19Lxjr1o1/kdyEDi+ytqDbjQM9JP0Dg
         /sNHIlnmqPIhC1KmkPOM5utyV4fdIyOYQ92bdSt33WkGnPFqosR2kLnIRkqijW0qdL2j
         olwpZqV0mquYlBLjM1hLX49xzuJauOijrxPfJ60cxX0AQipPuexytJ8on/jsD7HwzTbx
         6avA==
X-Gm-Message-State: AOJu0YwPEmsMvZKPAmCEQALTzIbMKBd2/U1sBJh1bFC+QpDtskw18TGU
	iKtCmwdi/hnxoNQnsKTwatWZuigWwRF+kjDiwYZYuUVt7XCTyd1/PgsKKVVx3YgSUg==
X-Gm-Gg: AeBDievXu2n4MD8DBu/koWegqwbTJKIXXIZmw2xLWr6cOXuAx5i9N/44wxV1l3iDEcn
	Nqq+rfqTLYZ67tbshitTCZgmpdp4MJoJ9Vkz7FtYDRirQATBCwWdkVTp52+TGDCNLxbIG2K1dS4
	KkTN+Qww2qgJxY0Emrhkq8cH3NoctkkV1hu05aLXn8KjJjPdEcd0ntWwcWuEKNlxZRJBr+o+UFu
	mWArfTAdEW0aoPWVHUtfvHmlcYrrfRYVpY31vQYie0vZKWqydFzEh03oJ/eCcohujvyBZmK2QWN
	1hM+CVi0hRfZVRNixGfsEjfqLqkncZ/m2JoQiOWyvAE2fDMZY6dqZJhxL2pcMa9zburlQersiyY
	x0MOwBMFk200TBAjHI+yEkZMCM/oRdiQ4MT9uUNq26D7Y+kOIrQlhWk8BNu2C6PsZV6+4lJC2Zk
	6zdAPcvkVEqPEAlCSzvnR18tjNXIeKbwiHKIZLWfyBEB87MQ==
X-Received: by 2002:a05:622a:1883:b0:50e:5755:912e with SMTP id d75a77b69052e-5100e19b5admr66119731cf.35.1777408699700;
        Tue, 28 Apr 2026 13:38:19 -0700 (PDT)
Received: from rowland.harvard.edu ([2601:19b:d01:d210::a0bd])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-5100dd32da7sm26926131cf.17.2026.04.28.13.38.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Apr 2026 13:38:19 -0700 (PDT)
Date: Tue, 28 Apr 2026 16:38:17 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Oliver Neukum <oneukum@suse.com>
Cc: USB list <linux-usb@vger.kernel.org>
Subject: Re: block error issue with root hubs
Message-ID: <81b23197-e87c-4900-9f7b-2979873e6740@rowland.harvard.edu>
References: <cb004ecd-ee8c-4d3d-a687-4a0f087519eb@suse.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cb004ecd-ee8c-4d3d-a687-4a0f087519eb@suse.com>
X-Rspamd-Queue-Id: 2645F48BDC1
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[rowland.harvard.edu,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[rowland.harvard.edu:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-36654-lists,linux-usb=lfdr.de];
	TO_DN_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[rowland.harvard.edu:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RCPT_COUNT_TWO(0.00)[2];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[stern@rowland.harvard.edu,linux-usb@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-usb];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,rowland.harvard.edu:dkim,rowland.harvard.edu:mid]

On Tue, Apr 28, 2026 at 09:02:22PM +0200, Oliver Neukum wrote:
> Hi,
> 
> looking at UAS error handling it seems to me that there is
> a small likelihood of deadlocking when we wait on other tasks
> processing PM requests on the same device. Do you think
> the attached patch is enough or do we need to pass the flag down
> into the HCDs?

This is good enough.  Practically everything the HCDs do is under a 
private spinlock, and they have to assume that their callbacks are 
invoked in atomic context anyway.

> 	Regards
> 		Oliver

> From 767e9af371bf63413f1f7c0b2eca15bd52cdc1bb Mon Sep 17 00:00:00 2001
> From: Oliver Neukum <oneukum@suse.com>
> Date: Tue, 28 Apr 2026 15:38:17 +0200
> Subject: [PATCH] usb: core: hcd: fix possible deadlock in rh control transfers
> 
> From within the SCSI error handler memory allocations must not
> trigger IO. Handling errors in UAS and the storage driver may
> involve resetting a device. The thread doing the reset itself
> relies on VM magic. However, that is insufficient, as resetting
> a device involves resuming it. Resumption as well as resetting
> involves conrol transfers to the parent of the device to be reset.
> That may be a root hub. Hence usbcore must heed the flags passed
> to usb_submit_urb() processing control transfers to root hubs.
> 
> The problem exist since the storage driver has been merged.
> 
> Signed-off-by: Oliver Neukum <oneukum@suse.com>
> ---
>  drivers/usb/core/hcd.c | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/usb/core/hcd.c b/drivers/usb/core/hcd.c
> index 89221f1ce769..d95000c7b328 100644
> --- a/drivers/usb/core/hcd.c
> +++ b/drivers/usb/core/hcd.c
> @@ -448,7 +448,7 @@ rh_string(int id, struct usb_hcd const *hcd, u8 *data, unsigned len)
>  
>  
>  /* Root hub control transfers execute synchronously */
> -static int rh_call_control (struct usb_hcd *hcd, struct urb *urb)
> +static int rh_call_control(struct usb_hcd *hcd, struct urb *urb, gfp_t mf)

However, I do suggest writing out the new variable name in full as 
mem_flags rather than the cryptic mf.  For consistency with the other 
usages in the source file if nothing else.

Alan Stern

