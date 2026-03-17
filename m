Return-Path: <linux-usb+bounces-34956-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8HeJBHKEuWlyIgIAu9opvQ
	(envelope-from <linux-usb+bounces-34956-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Tue, 17 Mar 2026 17:42:26 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id BAF582AE40C
	for <lists+linux-usb@lfdr.de>; Tue, 17 Mar 2026 17:42:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id A024D30862C3
	for <lists+linux-usb@lfdr.de>; Tue, 17 Mar 2026 16:38:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 843623EBF1F;
	Tue, 17 Mar 2026 16:38:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="JyvYIRvW"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 264D1375F99
	for <linux-usb@vger.kernel.org>; Tue, 17 Mar 2026 16:38:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773765508; cv=none; b=o4GN1Ky5pBpDfUxT7IBSTlSzdv4hPVhTw0IKCviYTCkYjVDG0rAsvMg6Esa3Lo8UTcFxJlZhFKi7ZJHqdXMxOaXFl19nh4xlI0+6zfq8xymsNlkPr6U3yKFaw5TpqGRT4G+6S9B9lb6G98uOEASh70kZPz+D/8DICY7mPCHYE0I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773765508; c=relaxed/simple;
	bh=GalLhym8PhTqJ7xrDfNn2Bb94b2pFwdHTu8Jw2xTqls=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=o1zUphiT+4ZE/clCTDqSkfuVhtsIgfHZ26QsnexSV/vav/k6S2VXVCPArxewzLu/s4sACvKS8/+sSab8EaLIvjM5hN+9TIYYaRh5KdLp0BBI+cSYLNbVHhq0+6/jiXLLPn653O1hxhsKP+HaVbIHkgTUDOsO+0LSCjL7fB6woe4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=JyvYIRvW; arc=none smtp.client-ip=209.85.160.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Received: by mail-qt1-f180.google.com with SMTP id d75a77b69052e-509046c5c7fso74380731cf.1
        for <linux-usb@vger.kernel.org>; Tue, 17 Mar 2026 09:38:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1773765502; x=1774370302; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=lU4j7u7qB7NKyiYAh11jHRQXrqQaqS0wNGhTelRvvIw=;
        b=JyvYIRvW6Jgbxi3KTVjbR4+c78+oaFooM6EpfUhyPGiDkFkRno/5rtn/A3cgbx96ft
         KbgKXrYfhanWLkESpixyqSvf7R8rCwYwjBMsWON4EOtR0wNXn/w+POyJoi+Ulq1MBHgw
         aaRxXQA7CrbCRFrqedO9DNd6UoCZENt2lqbggn5Mj71ReOqLq+IvZB6QmTEGMFypbq/O
         47297MaZ4HFvQ5xT4WEghjyXmNLvBlk0/Pu60mETQD+yFLBHANhn+x3HWSrUAw+Le0hy
         Iztv4Ck39X38Ma5m+1BCJBGR4aCZzzH3A/0BliKYn1ZVqSeQqdTEwn0noh9oBPA4r1QU
         jqEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773765502; x=1774370302;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lU4j7u7qB7NKyiYAh11jHRQXrqQaqS0wNGhTelRvvIw=;
        b=rJUy12cNKvez0DXSuf/xlVEzv37aBqqYdgGBqFYpITzidowPVYgX+1jcf3vdzIz8N9
         rMImgsbkpionfhJT90PquFCjHbZ//PcJ0oo9hlzXRC+tMDHFK6UsjKYQln3AW1pXy8Z8
         ICiHwa6fUQqgey2PaLt5oTG/pO66x0AWOvprPlas1LPbsBXT/s1LOXJmpeXcHOOK/YYN
         2FDvHUxK232lnqHIdU1Yd7y1DQAZNkgOdm8OQ+ncuItTl4e0BV4y2QIf9KjmEE4fFTog
         jqgajh9mkD/LKW8cY2SrGlUYIeb38zx4F456K256YKQZ9PRSXZeq44W6TAwco2Gi6HEi
         iv3Q==
X-Forwarded-Encrypted: i=1; AJvYcCV0KHudNg6ziMAl2I+keIxZXyII7bKzoAQUVwmFR44lMbyv11uyErSgWvo/9dC1t5uSIONL2k2l9wQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxu1L1GZ60ye7wpRNmy6ZemSSfABYkWBhf1XbeHoY1Zu3U1oTK5
	6e0iLabol6NppqoS6ek1pGIPJ6EpZmmMLlbecDpOOQtqj53LgAGmOAigWDu/rGIWsesA0mz75bw
	Tm7Y=
X-Gm-Gg: ATEYQzyR3MbbFQhya4qJBLn03Qtw6ilzTz68eZUzfGmuamNVmyKj4CTtwYnMW+X+WXQ
	itscP/z9MC6wrzQ2js3vp5iHTFvDZlNQk0tBSuI3s8/5y921XmtV6sNvHiVkxeAbRyUzVRI0+Cz
	zLiyo5xaWOoX7FKYjCKBdeouRdOxHVXwk0VAgKCarAxDI5Qzwot09MG17u6J79jKZtgTQesLdpS
	m2gDsf+CsfjZTe5LBhSNwTQVk2yHXQzV67aEZcCxjn+7bdz60n1u4tPMB0ahgFJ6wGwnXv7fgNf
	JA4CGiU+4rwV64cXgv1gWEfKiYOBOQzX670pNlTNVqwUdN8C7vERRak/6kjgE1kvqHWo5AYAF2K
	Zx4sX+79GHU09bRwm04ZbA0BHBCCpOsdoOBwuBVDW/ORno/Qs6KdW4lzJAaN3Wg7cOPpt3Wnlq3
	Jic50mqsOHlyFNtRn9RoSjoAQb
X-Received: by 2002:a05:622a:189f:b0:509:1748:6df2 with SMTP id d75a77b69052e-50957db57f9mr237397571cf.30.1773765502006;
        Tue, 17 Mar 2026 09:38:22 -0700 (PDT)
Received: from rowland.harvard.edu ([2601:19b:d01:d210::687c])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-50b13598c7esm2062941cf.18.2026.03.17.09.38.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Mar 2026 09:38:21 -0700 (PDT)
Date: Tue, 17 Mar 2026 12:38:18 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Oliver Neukum <oneukum@suse.com>
Cc: shitao <shitao@kylinos.cn>, gregkh@linuxfoundation.org,
	linux-usb@vger.kernel.org,
	"linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>
Subject: Re: [PATH v2] usb: usblp: add the reset_resume function interface
Message-ID: <ccf9e0ab-3a45-44d6-8a51-955689fa69ec@rowland.harvard.edu>
References: <20260317125614.3215254-1-shitao@kylinos.cn>
 <c4f66c3b-7cb4-4bcc-868a-d3aef2d9e521@rowland.harvard.edu>
 <03344b43-b3aa-4800-b4dc-0b5a2b2fd5b4@suse.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <03344b43-b3aa-4800-b4dc-0b5a2b2fd5b4@suse.com>
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[rowland.harvard.edu,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[rowland.harvard.edu:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-34956-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[rowland.harvard.edu:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[stern@rowland.harvard.edu,linux-usb@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-usb];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: BAF582AE40C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, Mar 17, 2026 at 03:35:26PM +0100, Oliver Neukum wrote:
> 
> 
> On 17.03.26 15:06, Alan Stern wrote:
> > On Tue, Mar 17, 2026 at 08:56:14PM +0800, shitao wrote:
> 
> > > 9. Result: kernel panic in pm_op() with use-after-free
> > > 
> > > The bug manifests as:
> > > Unable to handle kernel paging request at virtual address 006b6b6b6b6b6b93
> > > pc : pm_op+0x50/0x80
> > > Call trace:
> > > pm_op+0x50/0x80
> > > dpm_resume+0xdc/0x200
> > > hibernation_snapshot+0x234/0x3d8
> > 
> > First, are you certain that setting the reset_resume callback equal to
> > the resume callback is the right thing to do?  Don't printers hold some
> > state information that will need to be restored after a reset?
> 
> Correct. This will not work.
> 
> However, if we take the trace seriously, it means that resume() was called
> after disconnect(). That must never happen. Yet, if that happens the issue
> is in the PM core, not USB.

In fact, it would be good to have a kernel log showing more exactly 
where the invalid request happened, what was on the call stack, and what 
device was involved.  The log extract in the patch submission doesn't 
even include any details to prove that the error was associated with 
usblp.

In general, the PM core will invoke callbacks in the USB core for device 
resume (such as usb_dev_thaw()).  usb_resume_interface() is then 
responsible for calling the driver's resume handler -- or not calling it 
if the interface's needs_binding flag is set, which is what should have 
happened here since that flag is set by usb_forced_unbind_intf().

Alan Stern

