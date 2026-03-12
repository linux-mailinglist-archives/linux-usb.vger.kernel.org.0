Return-Path: <linux-usb+bounces-34687-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AIksItvLsmlTPwAAu9opvQ
	(envelope-from <linux-usb+bounces-34687-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Thu, 12 Mar 2026 15:21:15 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8835B273378
	for <lists+linux-usb@lfdr.de>; Thu, 12 Mar 2026 15:21:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 33084300863C
	for <lists+linux-usb@lfdr.de>; Thu, 12 Mar 2026 14:21:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 81C6335C1B1;
	Thu, 12 Mar 2026 14:21:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="Ieyv1red"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com [209.85.222.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2A2B3148DD
	for <linux-usb@vger.kernel.org>; Thu, 12 Mar 2026 14:21:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773325267; cv=none; b=uEZaP/fRX8H0zuV872SADN5upSsefWE6u9ULLUVkj6CPB1pR13TXygxix/MmsJ1i5w2aL+OjBfxzcrVdG/d7qzSnQ0ERDCmYV7MjgDUP4Kf6rFWKfwjaz0Tlzx07BFBZ8CH7j2rqgAMggoOf9CCNYbtI3Tb2F0Nq1mfQYERcb9o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773325267; c=relaxed/simple;
	bh=38/q1JxCHSogWNCR3lhwCNQV/TrrD6snuqT6yxXjVdw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EjLn1SX5w+0y0z+svmD7oRBE4rw4wkSvU0oATGAOnzuWl5aSjSjsCcV37gZIp0w1PNqo1S7yhQTD3BpBcIF1PSGqwcS2f+dZQr0q3ceEN+RaiAGrlGtzem/u84uOJt6pSHh/zaM/r/NoIVVKma+vA2wGmHxgvIGPAgvZVpIKSPM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=Ieyv1red; arc=none smtp.client-ip=209.85.222.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Received: by mail-qk1-f182.google.com with SMTP id af79cd13be357-8cd73c4a827so98368185a.3
        for <linux-usb@vger.kernel.org>; Thu, 12 Mar 2026 07:21:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1773325265; x=1773930065; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=foLLIWpftweF1n/Vms7i9wHfhUkcnFDNpl8QbUSXjw4=;
        b=Ieyv1redzdQ+31j19bDcGlB30o2nIlF0azwVGn0AQ5q9C986noAp2Tl1EcYS1d/0iN
         s76iXj8bkvpEZv/U5Gy0W+R7DY/OH882tRTvGeBDbO9Z9zkt2JrTuUwuv93sLBhgq4K0
         0Ri0d1IL5AjceUvCQrR5bgsIUtACJ5Qfver6uaTDTpuNioszvT5nq2t7Dsttl1oOfJWz
         SdmsIKJofDItEPfIveWLnLUyDHjiLOKPR4HDovc7mK3uHM2mJUetKsKV+pITwLP4l10d
         n5NLfUTjXy986mkkuTozxnwtsgt/n1h0EiFCp6nk0Vds63PRPN+FfXFiVCtXZMOoxX1d
         oc4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773325265; x=1773930065;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=foLLIWpftweF1n/Vms7i9wHfhUkcnFDNpl8QbUSXjw4=;
        b=ffzDgUsV9QXDPOlKfYVquNnqUHfJ1Ki17tGJ3ll0FMjEwHRGhCcbUeFGCNuBHdISn7
         2PRsATUfvI98jctF1zAfjMOG9UzHoRbLUQskM0lczAp6Tgy1HPgzaau4O8ArPYw1Cdw6
         7PxIeuxERNycivIFH7zj68NSpLTD0nfH4zXi9Q1r3HlhEvfKB2ezRoSxqmJRamILPnGN
         GNVcBHom6rzOJi7nlcikPN2Of7/vSAdW5D0NZBCS6xXkp3QGUAlaQc0hW0S27tkiklPO
         UWfv7/YzmF7soe0Nk4yqcgAoZr2JN+znIv1tQx9PJw17hZ41ddFFvaHorC61IFzgvQEo
         FMew==
X-Forwarded-Encrypted: i=1; AJvYcCXsh3CDFMiJpe/24TvJMG2yK5lSGf4KoJjmsoUbkK0c+n95bBDg2Z1zL7YskO3JPhHHlLfw4ER6rC0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz5BS3gR1tnGaqzRZxZOnJTahp7G6n3fBH1cBlnNayCMzAh6TM/
	a2lqvuib1mNe8n2Bt44B5JZ+JB5YMQIG9XSAshG7CbbfAn1HZNyVjdFQkj+ENW5DZw==
X-Gm-Gg: ATEYQzzr4VcJiqsCd6UGXneS0tTkBjt7tAkGDnHOjaNwvNriMynsSe15IwW6+nnw7JE
	wlPtAQxQFljvjzIT4JTFGI+5VWUwqNa2u5Hxo6ABr0RBMosu/gYQrl3LsKRugPs5zUgl1cZbtKj
	eVqVATlEzTnfoIahjb91+6oVPgsRMlDE2+n93SCZoJBkEgyxu3LuccHtk/e+PYn3KfqKJCeFBs6
	5b9jhe9zsIRKaECtebUOztToz58/Vv9bbIu2Yc6gkGKlgYrM1LQQ+d9HU8uoTiO3/32OH7UeE3c
	pFNkUCyQ/qpTgdV2XwTaTXo9c5cVwJRXv5oCPTRh9RVPaHwQHYAvoDIx+ooUjSfv5DuSQcck3Y5
	r/EYWGprFzcQu4UwhjqQeYlTEcCPAP2JH0KKHnkD290xg/DgUd/RRgX5me7r0lAon/rTWraC5d1
	HQl1OMbovM5al9DG3851SJML1tfh03oQfoSgEZO2o30A==
X-Received: by 2002:a05:620a:4053:b0:8c7:1118:c514 with SMTP id af79cd13be357-8cda19b1a5bmr803883985a.17.1773325264501;
        Thu, 12 Mar 2026 07:21:04 -0700 (PDT)
Received: from rowland.harvard.edu ([140.247.181.15])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8cda21647basm352237185a.48.2026.03.12.07.21.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Mar 2026 07:21:03 -0700 (PDT)
Date: Thu, 12 Mar 2026 10:21:02 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Oliver Neukum <oneukum@suse.com>
Cc: =?iso-8859-1?Q?Bj=F8rn?= Mork <bjorn@mork.no>,
	USB list <linux-usb@vger.kernel.org>
Subject: Re: correctly handling EPROTO
Message-ID: <4f85311c-bdfe-46a4-a310-4a74a3c56b3e@rowland.harvard.edu>
References: <261996a8-7ad4-4df2-a469-f6602da71255@suse.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <261996a8-7ad4-4df2-a469-f6602da71255@suse.com>
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[rowland.harvard.edu,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[rowland.harvard.edu:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[rowland.harvard.edu:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_ALL(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	TAGGED_FROM(0.00)[bounces-34687-lists,linux-usb=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[stern@rowland.harvard.edu,linux-usb@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-usb];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,rowland.harvard.edu:dkim,rowland.harvard.edu:mid]
X-Rspamd-Queue-Id: 8835B273378
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, Mar 12, 2026 at 02:55:48PM +0100, Oliver Neukum wrote:
> Hi,
> 
> as we just discussed an HID device which tends to report
> -EPROTO from time to time, the question what a driver is
> to do when it gets -EPROTO.
> Do we just retry? I am not really happy with that, as we
> may very well get into a livelock. Nevertheless I think
> we cannot just assume that -EPROTO is not recoverable.
> 
> Do we need to do something drastic like generalizing
> the backoff logic from usbhid?
> 
> What do you think?

There's a discussion about the same issue here:

	https://bugzilla.kernel.org/show_bug.cgi?id=221184

See especially the later parts, starting with comment #28.

Alan Stern

