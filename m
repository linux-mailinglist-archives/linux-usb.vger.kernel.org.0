Return-Path: <linux-usb+bounces-33663-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8IrKCg3KnWmxSAQAu9opvQ
	(envelope-from <linux-usb+bounces-33663-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Tue, 24 Feb 2026 16:55:57 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9727A18969F
	for <lists+linux-usb@lfdr.de>; Tue, 24 Feb 2026 16:55:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 39A4430117AE
	for <lists+linux-usb@lfdr.de>; Tue, 24 Feb 2026 15:55:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DF0303A6403;
	Tue, 24 Feb 2026 15:55:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="hNFISgBq"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com [209.85.222.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49C7D29D266
	for <linux-usb@vger.kernel.org>; Tue, 24 Feb 2026 15:55:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771948549; cv=none; b=nYNlwLVck1fDcfJp1Ehsn9Y58Nbq6plceCsWHDlH/XOnu/PTWOTv/pJT9JoG9pxvttmcHQy6aofJZOh3XulbVob8o3l9BBRldV0vY5NO1tikfUw5yKR7LahR55m0ENpgwKDSx+ObJH0Q5Wt3Ii3FtfELYR2e+Z+2PBgCZXB2LIY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771948549; c=relaxed/simple;
	bh=7tqCxQNsRcbE5TeT15GXgKNUgqSdCHiaX1XrA6lMY90=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LQfupgS4TQZPoOg3w5KfwioDzORq+eMzlhmp+TH8lWxYSDIuG9SA17AP6f4jqOeY6SS+RifiKSlnqTCe4iKI1JQpblFpPuIxQmvcQQveHbPrB2E8AkM06gVdzzSXLH2affHnwCJYr2wSkBCexYkUb8W90xMz+musfz2Je38ukBU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=hNFISgBq; arc=none smtp.client-ip=209.85.222.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Received: by mail-qk1-f179.google.com with SMTP id af79cd13be357-8c9f6b78ca4so702045785a.0
        for <linux-usb@vger.kernel.org>; Tue, 24 Feb 2026 07:55:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1771948547; x=1772553347; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=GkVOYRlb6n4mEh6iKFE5SspfyfIj3a3lu/cJ9yco4kc=;
        b=hNFISgBqpea7h3sj4Ay1pSjpvNy5cKbWkd6wV1gwUIhJj8WVbUeUd7Sf/4qVyH1e6O
         hLTPpVbwVuOa09ljGQIr/wY+XzFUUQ6waYJEEK/1qbod+Pn/NwMLiXGs+PANSuYClI7i
         LZiDMs6G1jnGRA6WDTmQm+OCUStt1gCf7JvsOmFPo4QmQAvMz2S68CHg99twbyg+4Mw2
         Dp/Wr8g8K9kiLzIyyr3gXPoU3gm61SYdRlWay4I3mq38jFlqM2IoOYLxVnyzOPmcLJsH
         z5afMS3233C5IcSi/AK2vr+yTO6x4JonLtomjnqpqGRgeOE2+/AA3KmO6tWhl62xkCLb
         jwtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771948547; x=1772553347;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GkVOYRlb6n4mEh6iKFE5SspfyfIj3a3lu/cJ9yco4kc=;
        b=RBKLFNMKiI547vHrj3qf/+G3OiFVsrwJN7k47T26PBeDMqSbJ+lkhQHJoVebCLQIJv
         Allt4lH8UA88a7A20DstnjrWVdGdt+E3kXWkiUx7P3VWeGQ3D+FvF6ant+h2hhI+RS/5
         3xANLDV8zWbRFDf7srZajDD+EgSRJ/UA7BVmR+xI7fjgiEmNKHaqX63ImXKe2qA++lN/
         LevtU69InFALYNPUPsNoaNSRDBl6ik0PQAMjgGLbDjSonoB23b6tLEwRufPjPYDYdNbz
         qneJfEuM/N/74N3LLMwJHefhLR2Z0t4u8QVq/5fLGcrAUY8bRlzg2so42kHJpnRng28q
         bDgQ==
X-Forwarded-Encrypted: i=1; AJvYcCUFXuk2Cw8Q3gICc6wc5oIc2NG+7r5WcPY751QOMTyjcE19AwIXIsT1UxWJCb2J/ULYOh5ya3yBKzY=@vger.kernel.org
X-Gm-Message-State: AOJu0YyInxYDKR3OL94Kxvz2oG2RABWwDwJfuOfSxJ5h2Ttgc/Pkf5Bp
	OrcXDCda6C7oN+RBB7DCII53MJJhtrHiOHZwjqkBdpgI8MbV8AAiKcP0U6pjkiWA5UoxBILt36B
	o0vU=
X-Gm-Gg: AZuq6aKk/rmUVPiABJSX68MCSGi9cBlqwm5Z6QfzWz7/09aH0U6SOnoFVIWC+F/lnh6
	9jl/lgSAVBEGDAHd4J5PVa///OmxF00eIh9S81tKwrZDOC+hqjrcrVEspHn7ued8iSV+fWdl4ZJ
	OQte2bWTEn4b5jheIUquD/8O4wHA7a8xseCdJPPyJc+9xUk5N9f5iTzG0unwYZxZqzzoi+0qeum
	y/I67Fd/7FYSbMJeofDohLjLljgISdsDkzyJke/OqDPvkCaOPmaZenR9BXccn425MGuIoIwUvIh
	iOHwfHoiVCLTj8x0LjLq5WQ4LANppgM+k86kCVXogcTh3XJp9F/MHs8WKkaSgNDszvh5VBOvcwP
	SOUe76jWH7WGaWr/q2UBUCJ7hmCVVourrzQjOy1vk7Oy1D0Upm/1Mhf46p2IvHeRSY8LtpDXIfC
	EE1SMdn/wGGoLiayTbDQdvaifR
X-Received: by 2002:a05:620a:4483:b0:8cb:4128:ec29 with SMTP id af79cd13be357-8cb8ca992a8mr1547879485a.72.1771948546936;
        Tue, 24 Feb 2026 07:55:46 -0800 (PST)
Received: from rowland.harvard.edu ([2601:19b:d01:d210::687c])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8997c6911dfsm95477506d6.2.2026.02.24.07.55.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Feb 2026 07:55:46 -0800 (PST)
Date: Tue, 24 Feb 2026 10:55:44 -0500
From: Alan Stern <stern@rowland.harvard.edu>
To: Oliver Neukum <oneukum@suse.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	USB list <linux-usb@vger.kernel.org>
Subject: Re: further issues in uss720 disconnect()
Message-ID: <33708317-1a17-4d44-8dbd-423902db335c@rowland.harvard.edu>
References: <00b407f7-9adf-4666-bfc3-3c4fbbf7dce7@suse.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <00b407f7-9adf-4666-bfc3-3c4fbbf7dce7@suse.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[rowland.harvard.edu,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[rowland.harvard.edu:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[rowland.harvard.edu:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_ALL(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	TAGGED_FROM(0.00)[bounces-33663-lists,linux-usb=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[stern@rowland.harvard.edu,linux-usb@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-usb];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,rowland.harvard.edu:mid,rowland.harvard.edu:dkim]
X-Rspamd-Queue-Id: 9727A18969F
X-Rspamd-Action: no action

On Tue, Feb 24, 2026 at 11:29:42AM +0100, Oliver Neukum wrote:
> Hi,
> 
> looking at this driver
> 
>                 parport_remove_port(pp);
>                 parport_put_port(pp);
>                 kill_all_async_requests_priv(priv);
>                 kref_put(&priv->ref_count, destroy_priv);
> 
> Now looking at kill_all_async_requests_priv()
> 
> 
>         spin_lock_irqsave(&priv->asynclock, flags);
>         list_for_each_entry(rq, &priv->asynclist, asynclist) {
>                 usb_unlink_urb(rq->urb);
>                 ret++;
>         }
>         spin_unlock_irqrestore(&priv->asynclock, flags);
>         return ret;
> 
> we see that the driver is using usb_unlink_urb(), not usb_kill_urb()
> In other words, once we return from this function, the completion
> handlers can still be running.
> After that we do destroy_priv(), which will happily free the descriptor
> 
>         usb_put_dev(priv->usbdev);
>         priv->usbdev = NULL;
>         kfree(priv);
> 
> Assuming that completion handler runs after this
>         struct parport_uss720_private *priv;
>         int status = urb->status;
> 
>         rq = urb->context;
>         priv = rq->priv;
>         pp = priv->pp;
> 
> we see that it will happily access kfreed memory.
> 
> I think the driver needs a wait queue for asynchronous requests.
> Or should I look for a way to use usb_kill_urb()?
> What do you think?

Another possible solution: Keep track of the number of outstanding async 
requests.  Then take a reference to priv->usbdev whenever the number 
goes above 0 and release the reference whenever the number drops to 0.

Alan Stern

