Return-Path: <linux-usb+bounces-38034-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +I8ZO7+lFGrJPAcAu9opvQ
	(envelope-from <linux-usb+bounces-38034-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Mon, 25 May 2026 21:40:47 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FDD45CE0E9
	for <lists+linux-usb@lfdr.de>; Mon, 25 May 2026 21:40:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A9241301AA57
	for <lists+linux-usb@lfdr.de>; Mon, 25 May 2026 19:40:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BB78638B7D4;
	Mon, 25 May 2026 19:40:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="CSL58RYG"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com [209.85.222.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC931372EC0
	for <linux-usb@vger.kernel.org>; Mon, 25 May 2026 19:40:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779738036; cv=none; b=ShhyXaCSSstSoAMs2cED6WwRGO9a/yz+Ulsu/odPejKfwBQ+cNsVdboDCB/QEvTS4ekKUcrGGQQhBOxzhgVeS0gtn2uKszm+snLU8bOII9nMEmbFWVReAGF6ehVOeDohbZkjpgBNja5mLgwU31BSYU1pLlxnTWHY0z/TpYyWTy8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779738036; c=relaxed/simple;
	bh=L1xa6/8OPc06NMscINzjX6g3anqLL8GTJmS5Dr+Z9IY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kwpddoYYC98h2L6sNImCb9fVZBuq/DazxUAwPZji7hWy/QzBK8trVj7LJVZG108b+n5DQE1dgakWm7nuE9tlci9UxgmwnaHnUdpZFovZPe/XcjT8Tb+x6ezdXsHXrEOez2txEkvkhKpeC72jmUcEdPqy9u9/vwk8K9rSnowcsi8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=CSL58RYG; arc=none smtp.client-ip=209.85.222.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Received: by mail-qk1-f180.google.com with SMTP id af79cd13be357-914bb8e95c2so167384985a.1
        for <linux-usb@vger.kernel.org>; Mon, 25 May 2026 12:40:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1779738034; x=1780342834; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=87zu2+zpmmokKau51ImwYtnM2oqOxBaSdU4la7TSpRY=;
        b=CSL58RYGg/51AOkw8XrE257tNDhGQCaLXK8zaJLzD5fcwb3uoBbEgzID62WvqEF/zg
         g/6vOPx33Um0RWUMx8MhJKRAQummi58aNZYldvgL15ih8pOxSKLud8be5L3Hj2Ix0C1L
         cz99wsGHPnFAKcMXKhj/I9Y8KnzflxT0pe0xP6d7ojwhdKlzD6XK/9UwKOy2sEv0ijX4
         nWvAnqrASZXznMZTc+XnPZJwrMQZKIhF3jmZ0Imn6oVmEd92Ty0RUUx90kH+MZUKWvAf
         +kSRilYrM8L/FtAgCgZyuTDnuz6fl7pSpW+H/004uaPkWHmW77hhXnLexe14xsBcucwh
         xtsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779738034; x=1780342834;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=87zu2+zpmmokKau51ImwYtnM2oqOxBaSdU4la7TSpRY=;
        b=BVcK22WWaMToYnSVRgWmAoXEuVhjH/Euj5DZoubBUvc7wlA4VEIDPF59bB6QFCXXuo
         /Hv4acvvpynu27h+3DNhcoH2wa1pmtpj3eA1a+L3CmCx6KnwBJtjbt8v0I7AkTP+MhyX
         ie4hk4aWmc9zNSmNCgU1jXm+K/GwtNejbnr2ae+u85xe+HKVVnAIfTCQqNTDD6hJY/IH
         5pXPiaQa40dz5qAFO60mIJbWHqetm/uAsqSlGnt6HvuvuCvFXstSmswePNgbInKnBSGc
         JN8mNWcTRJvKB+/nmDVSraqXNrwnrLoc6O+6dYHb1GeWJnbqYqOc/TuIEbus+qgWqa1h
         MVHw==
X-Forwarded-Encrypted: i=1; AFNElJ+Zz+gX57AZZXPLi529F5pTwgKe4Nab3QWJGpJl+hg4uoA6VqbGgLeYI7wxDDBH1ynxyqLb2nsdpKE=@vger.kernel.org
X-Gm-Message-State: AOJu0YycfFR17RvU4SXnC4DeOkb89siiFXQW8J91AGXMTomweRSDBgd0
	amhrQtmHvKxvoqOV6XGXqhiQgmgM+mNOZ0NHhwY3cDUCrsx7gtAZ+3pnckCfTJVAxQ==
X-Gm-Gg: Acq92OGnsZyf4CeJsoJKcLBhylg8QH1qovl18sqWrcVsRH1N0NY+amjboUDABMiF6g4
	KIvt6Fr3GH9GtGtmhofXnhTy+Ksx3fSEDgu55k69nDL2jmgJ/aMdAQa804Kp/edOyC2K+hRtJP3
	GIA9H15iwNvzKGOM2cBQSh55ek/R/ICIft+U86L/1NykfydwXxyyu73iNifvFnBKbXtf4M5RMzl
	EWYlbyK+UOa8qNfJmPybKG8Xp7zYMQWS1N39iWirRbmZrruT58VJvwJLv766/RJNjKBKxn8g9HE
	9sMQCeNZHE/JXsNxR1XztSZTFAWvVgrwy5fW+rtEth/tZmwFUE3RcomZny0Fqgki9sjPJ8nNA4R
	XsViuQI6NK5UpNbR52Zfo49eghRHNEEt2dsmbTtnTmp3L03Fu36fbmwgBDjy7nr8BrjHJVeqxlF
	W2ByIThpvVP+VmFl5wSKhIDIlXL0T6UXpjP2Nzt7Xkd57cIHpm7qPjPIGzWT6HvPWo
X-Received: by 2002:a05:620a:44ce:b0:8d1:a75e:2f8c with SMTP id af79cd13be357-914b49e07c7mr2182004285a.53.1779738033681;
        Mon, 25 May 2026 12:40:33 -0700 (PDT)
Received: from rowland.harvard.edu ([2601:19b:d01:d210:d62f:1911:f952:16ba])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-914bb8e8d91sm1113879885a.11.2026.05.25.12.40.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 May 2026 12:40:32 -0700 (PDT)
Date: Mon, 25 May 2026 15:40:28 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Henry Lin <henryl@nvidia.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH 0/1] media: uvcvideo: reset interface on bulk stream
 stop
Message-ID: <3fd4f5fd-5a52-4584-85b7-1c3b76e7285f@rowland.harvard.edu>
References: <20260525182028.2148267-1-henryl@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260525182028.2148267-1-henryl@nvidia.com>
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[rowland.harvard.edu,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[rowland.harvard.edu:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[rowland.harvard.edu:+];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-38034-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[stern@rowland.harvard.edu,linux-usb@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-usb];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,spinics.net:url,rowland.harvard.edu:mid,rowland.harvard.edu:dkim]
X-Rspamd-Queue-Id: 4FDD45CE0E9
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, May 25, 2026 at 06:20:27PM +0000, Henry Lin wrote:
> Hi,
> 
> I would like to revive an old UVC bulk-streaming issue originally reported
> by Hans Yang. I am sending this RFC on his behalf for discussion before
> submitting a non-RFC patch.
> 
> Hans previously proposed making uvcvideo call usb_set_interface(..., 0)
> when stopping a bulk-based stream, before clearing halt on the bulk endpoint.
> The issue was discussed here:
> 
>   https://www.spinics.net/lists/linux-usb/msg171584.html
> 
> The current upstream stop path calls usb_set_interface(..., 0) only when the
> streaming interface has more than one alternate setting. For single-altsetting
> bulk devices, uvcvideo only sends CLEAR_FEATURE(ENDPOINT_HALT) to the bulk
> endpoint.

How does it send this request?  By calling usb_clear_halt()?  Or some 
other way?

> The patch in this RFC changes uvc_video_stop_streaming() to always call
> usb_set_interface(..., 0) to reset the streaming interface first. For
> bulk devices, the existing CLEAR_FEATURE(ENDPOINT_HALT) request is still
> sent afterwards.
> 
> On the affected devices, current upstream stop/start sequence can leave
> the next bulk stream failing immediately with transfer errors such as:
> 
>   uvcvideo: Non-zero status (-71) in video completion handler.
> 
> USB bus traces show that, without usb_set_interface(..., 0), the host
> continues the next bulk stream with the previous stream's sequence state,
> while the device expects the new stream to start from the initial sequence
> state.

(I assume by "sequence state" you mean the USB-3 sequence number 
associated with the endpoint.)

Are you certain about this?  The usb_clear_halt() routine has reset 
the endpoint state, including the sequence number, ever since commit 
3444b26afa14 ("USB: add reset endpoint operations") was added in 2009.

If uvcvideo isn't using usb_clear_halt(), the simplest solution might be 
to make it do so.

Alan Stern

