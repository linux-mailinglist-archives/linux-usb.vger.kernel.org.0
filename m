Return-Path: <linux-usb+bounces-32963-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id zRn0OEBAfml7WgIAu9opvQ
	(envelope-from <linux-usb+bounces-32963-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Sat, 31 Jan 2026 18:47:44 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 392FDC366F
	for <lists+linux-usb@lfdr.de>; Sat, 31 Jan 2026 18:47:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id EE6CB304224D
	for <lists+linux-usb@lfdr.de>; Sat, 31 Jan 2026 17:47:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 99C06362134;
	Sat, 31 Jan 2026 17:47:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="PNNdISxb"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com [209.85.219.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 826CD2FD1A1
	for <linux-usb@vger.kernel.org>; Sat, 31 Jan 2026 17:47:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769881645; cv=none; b=nEad0p1vXQln4QEkVZJxu89gPbWDgUe0eQ9iAv01l0ORmPc+iIcsHOv7tIeqcOX6m+4FyV9Vt2O3tnizdmQloYE97cLbljRjCEOlLvLjjgJC4gc4X52lzGrPd99ItYjtBB2dkBc5odnsTRnnQz6WR3TSQT4Ssb/cdAJuE47NE58=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769881645; c=relaxed/simple;
	bh=BETYAgso5jBnzTlSoLm1dZmmbGnaX/vGjSVvlmlM390=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kQUvrDxmBcisQGKx7GLl31ixwOGaQGL/ZPc1eq44Ive0kpjAsr8XNaMaOBMdAXwm4hVaLcn+8HUq7mrdKTdF6MOKwJgRH2CJnbSsxdkrqK31V8Oy1iJbx4YIswdIZsdkd/c7uxGJH2sCNcuZRtAgaZtDA8vA3gp1Ku8eV/O0EdQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=PNNdISxb; arc=none smtp.client-ip=209.85.219.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Received: by mail-qv1-f50.google.com with SMTP id 6a1803df08f44-888bd3bd639so43286506d6.1
        for <linux-usb@vger.kernel.org>; Sat, 31 Jan 2026 09:47:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1769881642; x=1770486442; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=thTt1zmuohXR3mpK3QoXJHEGzRxi22cpKJ4VG3Tywag=;
        b=PNNdISxbtWTcByAUeMPIwjxyzXoQAavFxj0Ci+PVfXX25I50rz1vRePnDu0sWR/QUG
         qbW68+TdoadL3+M/+YFH0Cv+898Ozo9YPcQbM+rjD9WkrdNUATj+5nweBjA6SAReci6g
         fiCB4XyLLvzhneuBLTXDdD3Er1d7Br8HtWM6LqNYAK3LXhWJwFT61/6NH22oMv45GTKV
         t6PzYKyB3rQaT74eLbzc0a/JL+hMO1ilp9gfHO8+KbahwSrxtGTaWW2TkspHfKh1ydY8
         CtZJUdkrKvIuMzCNbqZcR4WIu0GriY4a4RrcXuRVdK/R40HtDrlNvqGU03C7bsJ9p1MM
         tzJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769881642; x=1770486442;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=thTt1zmuohXR3mpK3QoXJHEGzRxi22cpKJ4VG3Tywag=;
        b=ZI+EaQjKPcR/+LTffRSPkdwH2S1CslXsefRWYWUalF+94XXWVrCUJ1f72bwPgOOu07
         1lLj2Obh39Gp8rzgBeQaOlBdSDFsVxiKiPn13vP8bVaUoz30EheTe+cmVPA0d0SXsngS
         wtAEF3vYivaEPAO18yAKyDpGss6KqiqDHmdQfIZbXBZHwY6W0yZ7lqCpZK7uqeu6iHUJ
         WOPX0YLb8rZEJta18vLzXFQA7ZpN8QCc5ANfNhJPfFraoTGhOSLh7MbsPaFEMHQ6XNch
         ickmCUzWugsP0RtDXWO8Q7ulP7hoRjduA0dBGXfrgfAHMapM7zPnHJ30x6OxGJrc5131
         YmKg==
X-Gm-Message-State: AOJu0YxaQJRIOwiPWk8jsMao6cUnlU9NtheDF/SV5l9HE9k4qisAJPi0
	fdWDLBeMHGEiSNp57HzBXy3GIRevjrofpDL1eG2UQlA2LdYSVzgYFrI0igfNQI5QGA==
X-Gm-Gg: AZuq6aLeRQUexBC5vu3aq5j7fsU2+RIR7ygKUW4NHikEyU3Ezy+Hz9ORoSd7Ozz6l0G
	jMDKY6i5VMWStF7kZikINluD8bzGD52j+eFwe2I9qggbP/UpJvSs5b3a66HHreEpt8nNlDONW1T
	SVyK/x0u7ECmqErCREpMnSNQg/3ZnPSSd4Uk7+lv5pB8fVuIF64bP7NWaMPGXftKZssZXAxtk2C
	s84TPrQ5V3YTRN/6rHqYg/JVIyZ3EyEzREw6h8Oo2x+L45PPdogrfiiAFWcHGUFghwORJg+9n3C
	CQ6Sd6nW15Dbm+7p3y4zGiXORERJ1CfGKz/NznInPuHEl3YtZi3IRCLmXLzlavI/dVPSKSpz2tJ
	jLwE882/gPKnhc4S/4EV4WnxVCs2QC2Of101KRgjdoXOz3SO+S1ATHSVXZAnWw19KLdcPzqbrha
	E0sRUSCKGjqvil
X-Received: by 2002:a05:6214:1bc6:b0:894:6531:d613 with SMTP id 6a1803df08f44-894dfafdee0mr145093526d6.21.1769881642443;
        Sat, 31 Jan 2026 09:47:22 -0800 (PST)
Received: from rowland.harvard.edu ([2601:19b:d03:1700::7a0a])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8c7118bb151sm849882685a.0.2026.01.31.09.47.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 Jan 2026 09:47:21 -0800 (PST)
Date: Sat, 31 Jan 2026 12:47:18 -0500
From: Alan Stern <stern@rowland.harvard.edu>
To: HackNOW Team <hacknow@ikmail.com>
Cc: linux-usb@vger.kernel.org, marco.crivellari@suse.com, khtsai@google.com,
	gregkh@linuxfoundation.org
Subject: Re: [PATCH] USB: hub: add early rejection for corrupted or high-risk
 devices
Message-ID: <a8faa1ea-991a-48b1-909f-208cb2f17d2d@rowland.harvard.edu>
References: <9fcf5b72-7d3c-4677-aad1-6b7c4adf6a23@mail.infomaniak.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9fcf5b72-7d3c-4677-aad1-6b7c4adf6a23@mail.infomaniak.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[rowland.harvard.edu,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64];
	R_DKIM_ALLOW(-0.20)[rowland.harvard.edu:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[rowland.harvard.edu:+];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-32963-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[stern@rowland.harvard.edu,linux-usb@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-usb];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 392FDC366F
X-Rspamd-Action: no action

On Sat, Jan 31, 2026 at 05:34:34PM +0100, HackNOW Team wrote:
> Hi all,
> 
> This patch adds a defensive security check during USB device
> enumeration
> in hub.c to reject devices with malformed descriptors or high-risk
> device
> classes such as Mass Storage devices potentially carrying threats.
> 
> Devices that fail the check are disconnected immediately and a kernel
> alert is logged.
> 
> This is intended to reduce the attack surface at the kernel level and
> prevent potentially malicious or corrupted USB devices from being
> fully
> initialized. It does not replace userspace malware detection or USB
> authorization frameworks.

Pretty amusing stuff.  Thanks for the joke posting; I could use a good 
laugh today.

Alan Stern

