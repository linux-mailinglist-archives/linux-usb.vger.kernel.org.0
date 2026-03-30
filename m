Return-Path: <linux-usb+bounces-35665-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kPlXHhJvymnG8gUAu9opvQ
	(envelope-from <linux-usb+bounces-35665-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Mon, 30 Mar 2026 14:39:46 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id DFB0D35B268
	for <lists+linux-usb@lfdr.de>; Mon, 30 Mar 2026 14:39:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 038E93032747
	for <lists+linux-usb@lfdr.de>; Mon, 30 Mar 2026 12:36:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 51B273D090D;
	Mon, 30 Mar 2026 12:36:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UrVdXmGu"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78C6B3CFF6E
	for <linux-usb@vger.kernel.org>; Mon, 30 Mar 2026 12:36:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774874168; cv=none; b=oWLVsdiHmRPbeuoA9p/m3vC/JKwOkSTPzLMcVpJQn++2sW3xdxZnS4dsY7UtEQJwS8lJ9ytju73zPOF/+es8HrTXf+KSG71843QaJi3wDd3JTu8hAr2U6p+2TDEBX/q7fvUlXIlMWTcPdhzleL2qCssimV6XBVzXHMah8S+h4jg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774874168; c=relaxed/simple;
	bh=NcjLDtN7Kc5ljlFtFLDUx+iF1QK24JiI5QXebbJCAj4=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=MCPg9iesEhT8Jihjfq+puCErdveRYVOTnW1iiN3UwRZhSzkxRHYfQcs7Umo+8uGX4ipObM4zoO8tc8ximdPr49m8Qc8w1wWyEtWD7HiC00sgAUUSxJObGWUjb0431byc4SxCfPwxcBU9hSlw6Ejoq0UvuU+vT1n19Spnjv9zuPg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UrVdXmGu; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-b7cf4a975d2so567112866b.2
        for <linux-usb@vger.kernel.org>; Mon, 30 Mar 2026 05:36:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774874166; x=1775478966; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NcjLDtN7Kc5ljlFtFLDUx+iF1QK24JiI5QXebbJCAj4=;
        b=UrVdXmGuheAmltO4QEqg9p23WdCWpuiCoO/eQySn8bpW8Hv/sWcU2CV8mRO56XqgMc
         wxovIfkBdpEYH/2gdztoRVRMNCqQoJjAHLKU5iQ/GtMAJhr8zsvdVFkLdFtRnGy/9Ojj
         BTnAx6dGKIPke28UNX/FFlnF0fd28sEYDKMUncR6sCRSwko18YcvkMbnXh+hMffBUTcF
         Sf0G2Vwz3poPyIV1/ByXVLQc4cbR0/6XoFyMLl4ZsvDjucZRdu3Gdzn4Np3Ewz8cVCDM
         RaLZ3Megkmvrp2FG2RK3T3k2at5hFuzpDMphICPoWQ1p/XHR0heWfbHJl1gXvKknANml
         AKUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774874166; x=1775478966;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=NcjLDtN7Kc5ljlFtFLDUx+iF1QK24JiI5QXebbJCAj4=;
        b=PrNOjr67PSYB5yzktZSMb6C+M89Hnd+acuEi2E7JzYfinY5XV03TbhiwMzPld2qHxC
         fMwCm5tsxUVu5T0D7cm3iA+0Xdr7WllIhz+zA5Jj0gQjUozG1LyJQs5i8C6iGMP0BEc+
         yNfVyAdCH3F0ZLc1GGa5+5OoiVxnOyl2UAn5eVViJvgTlmi6O+H8s3RvkZz0xNHRV+yP
         7xwImsxAxFyI8B1rspInHipWxEJGi0vCI2geqmuUEJHouy/6h6IdrHseKFz07ECJPs0Q
         istn+e9Cl9tIjks6mwlVu7Ha+BrbdYA6crUoBbsn1gSkk3+sADipTPe5emixKHa0EeQS
         sI5w==
X-Forwarded-Encrypted: i=1; AJvYcCVJaDJDzbQa6XyVtbCXXZ5S0pmUJVeMf8fIiCY8mBx6Dz68dhhaRpmflvRQOB/pD7WvpTWJcvwfcIE=@vger.kernel.org
X-Gm-Message-State: AOJu0YzK08pvtlZ48R93cNU7dom/cH4mcZLTxX9cAGhTVPQ2x5qS4g/F
	xp7exBNNfLbMIaObc+jD9sbVMTltRzprvKXrgFgccp1Rz6Ue9QPIyjOr
X-Gm-Gg: ATEYQzzycEnMIAVinGOwNADZ5M7vYi0IMLrIRk56bYaal/wrngpYPg1Jdb8D+fCtBkB
	1/8tNpGNsSDZ7o+Bjy8RFHoXHr62OTC7pf9PFzTvXGGF8LfVp1yvVxpvfmfworakARtsabi9l26
	fvnuFYGjK4919PzkGb89d7ZOmMKiKbfacDBok7Oktv2QOMAMGBBt/MmD+pVDi8GN3k3YZZR9G13
	Lc713tNq94I+I6Vj811Af9JyYTr/Jl43et6B7CA1gDMtrEHPrtJrg5PKggjAG8kMh2RZGnhm/fy
	zom3Oj6zayPzFzKDBa86VhQ19G7y5KyGB9cbPeb92qM/+hvToCZKxov0TMyrQkwzHptRIGayDam
	Q4WXLALCziXhF2MZM7azuHgXhIzcBcPo4AZ1+4bx1JlkP+6mf1LMotm3I02/6K/jSVpLSrHr+px
	fmruvZbennrN75DY6O32Z53SYNMCB624yO
X-Received: by 2002:a17:907:1588:b0:b98:5030:5792 with SMTP id a640c23a62f3a-b9b507a653dmr521282466b.29.1774874165042;
        Mon, 30 Mar 2026 05:36:05 -0700 (PDT)
Received: from foxbook (bfi53.neoplus.adsl.tpnet.pl. [83.28.46.53])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9b7b1dda44sm285345966b.43.2026.03.30.05.36.04
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Mon, 30 Mar 2026 05:36:04 -0700 (PDT)
Date: Mon, 30 Mar 2026 14:36:00 +0200
From: Michal Pecio <michal.pecio@gmail.com>
To: Alan Stern <stern@rowland.harvard.edu>
Cc: Thinh Nguyen <Thinh.Nguyen@synopsys.com>, Oliver Neukum
 <oneukum@suse.com>, =?UTF-8?B?QmrDuHJu?= Mork <bjorn@mork.no>, USB list
 <linux-usb@vger.kernel.org>
Subject: Re: correctly handling EPROTO
Message-ID: <20260330143600.0594f0da.michal.pecio@gmail.com>
In-Reply-To: <ba68bdbb-9ffd-47d3-8915-9e2e40fd6adb@rowland.harvard.edu>
References: <20260318235920.ioek26hdr25rkksp@synopsys.com>
	<1eaf4cf3-4278-4d04-87aa-8b6069d544e1@rowland.harvard.edu>
	<20260319231620.3ukqxsrwqikp5zbd@synopsys.com>
	<2929d47c-fc02-49d2-873e-758f24c43071@rowland.harvard.edu>
	<20260321021439.7pmcdrpb5oxbivct@synopsys.com>
	<20260321065424.76a80508.michal.pecio@gmail.com>
	<d3fd1c0b-d0cf-40e2-9f21-b4c5de1c421b@rowland.harvard.edu>
	<20260328222217.297200bd.michal.pecio@gmail.com>
	<22c70ca7-57dc-4328-a5cc-d46c4f73556f@rowland.harvard.edu>
	<20260329184611.0afa92c7.michal.pecio@gmail.com>
	<ba68bdbb-9ffd-47d3-8915-9e2e40fd6adb@rowland.harvard.edu>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-35665-lists,linux-usb=lfdr.de];
	TO_DN_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[michalpecio@gmail.com,linux-usb@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-usb];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: DFB0D35B268
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Sun, 29 Mar 2026 21:32:26 -0400, Alan Stern wrote:
> A lot of video devices use the uvcvideo driver, which (as far as I
> know) relies entirely on isochronous transfers for its streaming data.

UVC allows both isoc and bulk transport. I have one bulk device and I
found that if I randomly change urb->status to -EPROTO, the URB is not
resubmitted but (on xHCI) the endpoint keeps going, until it stops after
5 errors (no URBs left). EHCI would presumably never restart at all.

I suppose changing this might be seen as regression by some, because
the effect of each EPROTO is just a few lost frames, at least in my
very brief testing. I suppose uvcvideo could be patched to clear halt
and resubmit, if this trivial "lossy recovery" is desired.

I also got a chance to see SuperSpeed sequence mismatch thanks to other
bug (xhci_endpoint_reset() called by usb_clear_halt() may do nothing).
The effect is EPROTO, consistent with my prediction based on USB3 spec,
except that on one AMD chipset the URB never completes. Weird.

If mismatch is caused by xhci-hcd clearing only the host side (rather
than the device being cleared as in the bug above) then it seems that
resubmitting without clear halt will never fix a SuperSpeed endpoint.

Regards,
Michal

