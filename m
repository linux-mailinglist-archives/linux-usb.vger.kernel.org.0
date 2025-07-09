Return-Path: <linux-usb+bounces-25635-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D7020AFED6E
	for <lists+linux-usb@lfdr.de>; Wed,  9 Jul 2025 17:17:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 09FDD647318
	for <lists+linux-usb@lfdr.de>; Wed,  9 Jul 2025 15:16:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0F6A12E6D2F;
	Wed,  9 Jul 2025 15:16:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="ccvAqtQd"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com [209.85.219.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5BDD28135D
	for <linux-usb@vger.kernel.org>; Wed,  9 Jul 2025 15:16:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752074179; cv=none; b=C0vZxzyti55BWPdW0DI+jNd4v8oxkKoNiOM6r6o/Xs7kGaiOhputXEfbx6Hd+PDzitL8OApjoc0cgwnx501xCzJ7pGYZUZ2WB4uT4AXzZn+7yUnoXIsOeHCOcF287TBPL6hUUWecHmgVlFjlfQfE3Z1LDIsyK/85NqlpbDxKvK4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752074179; c=relaxed/simple;
	bh=M/PkNLdrJfoEMHKFRc7KNT/Eas8/BG1qL2VpbXSMSYU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SED+vbxrNIaTipMmD+Ii0eLAcdaU/NnihfmPefk4NLyXpbnfnZSRqeQo4uynHcY4aDGdRYC6mMFypmUZEkX06ikCptrOk5QYKItOBF2vhfVCvJfCR7aL2/Oqp3b3F7lQovjb4KfPw/aXFkU4sqXotfPEba0toO67eciVOfPHggE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=ccvAqtQd; arc=none smtp.client-ip=209.85.219.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Received: by mail-qv1-f46.google.com with SMTP id 6a1803df08f44-6facf4d8ea8so242326d6.0
        for <linux-usb@vger.kernel.org>; Wed, 09 Jul 2025 08:16:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1752074177; x=1752678977; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=WsdbYMtsoP5IHaj/P7/gA1hMWGSlzJbOloShXNDUswc=;
        b=ccvAqtQdZsMbjbONmdfB4tz60ORnniKZLZDsRvwzz+5c28kQtiADVHxPaz0hYMvFNk
         sENlofz5YQvqhcuAIL3RRPX2T5s8NicbUu6ohir7PRZRhvteiHiTOO7rX8urgROlGmmM
         DzSJl6ZcodY8FyWtb8lTvEjQqIkgNpRr1HwW1jiCMO54JLJKOqURCg/uoSEWY1XbCC0/
         SlQg3SaOWCzGgBa98kdhG87LvFDepqQWjM+p9v6t2pQX2MOo6GAsWUJnnlewcPYmlLts
         HT0fVyLDxgEdb3M9NxgBkI38yZzKL93GEd6m3KZ77kqEr0TLSsEtUepashwiVeOUIuZY
         hkiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752074177; x=1752678977;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WsdbYMtsoP5IHaj/P7/gA1hMWGSlzJbOloShXNDUswc=;
        b=bJwx6TGbsJtlUWxHEpsvTn7JTG5rNP3nmchtxkxlpDFuxc2M0CERGbuIJbDXSFiuD7
         g4IEdM4D5NfgZVQTDRJ78pWaGKsbXFoMMdccDQWccki32EyQgD4MjnG7Ni7zVZUUla1a
         kmypCdgvvbPxDHbuO9AXRdy5xu1b0hAzGTiSQMCz5Gc5m0x8ce8+WqE2iBzgnGDWyyfa
         WlCR5wmiNn/DknHl3jIpwlZb14PeWcYe87dMloR/cTE3QRPaXIrdgXLFagRD71PkrLPj
         SLUtvagQUylWS+jP6KWhRufdy0RQbvu3jOwiTzfFo/d+fe/kZ7nPNLDZiVrwJz0Syt9Q
         4BUw==
X-Forwarded-Encrypted: i=1; AJvYcCVRR/42aybkKe9qoa9WyCMBdAufmYWHiDoKqw/ZQ3mX5/34FktI+CzNwaarORIQURwjn8wutjpwRUc=@vger.kernel.org
X-Gm-Message-State: AOJu0YwS8dSsAdA0fz+PYTn9O9DEqknMzlCgSce5UwcB69NfioA4Rl8M
	Q96C6M0dfBKvVL0tYR34EMiMHzh5M+8uM9IvtwyfnVyhewYA2AfZ4IATcNhTzY+R1IcMTbhVFPl
	6yQQ=
X-Gm-Gg: ASbGncuu5iZyQxs/lm4G4errwqXMLCkjgLw7zvMfx3THQDORHPMyWYdUNj86hxzfOKl
	cfReUC7cU0MSJQDcEbu8zYN/gO6O43Xc6/B11d53yc3fY9xO5ipDge2hM0rcqGFEr32Av7Sd21F
	6TtkQy2SR9Dd2m+DahzkvM+qkG83WyYD27t2AYDVxxTNVRZmi0dfpqaGHSUBs12xzstTnLHZEQx
	DKqKoSMD/Ko6gEWelOdQAw+OmJbJ82j0EMzb07bq0Ya6b5pq9J5ki9vUL9Jg50hRGLVSUFZUuBG
	GUzyj/tLzfTqCcY0DdS7lr5+ze1WuQ1BdyWdZnKrtgXGpd2RUxUsZIM2VjovbqtFpfOv8vSLqjz
	Q8tvQdECQm/nuQnE=
X-Google-Smtp-Source: AGHT+IFq/SMjQ8dE1aCLNMU2QhHo/z3MoLApUn/DvXQi38UdxBF+ToGFDbulcQ4Suod/amuFPLUcvA==
X-Received: by 2002:a05:6214:3d11:b0:6fa:a4ed:cce5 with SMTP id 6a1803df08f44-7048b9da2e3mr38991956d6.44.1752074176556;
        Wed, 09 Jul 2025 08:16:16 -0700 (PDT)
Received: from rowland.harvard.edu ([140.247.181.15])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-702c4ccd715sm93276016d6.47.2025.07.09.08.16.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Jul 2025 08:16:15 -0700 (PDT)
Date: Wed, 9 Jul 2025 11:16:13 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Benjamin Tissoires <bentiss@kernel.org>
Cc: Jiri Kosina <jikos@kernel.org>, linux-input@vger.kernel.org,
	USB mailing list <linux-usb@vger.kernel.org>
Subject: Re: Serious bug in HID core
Message-ID: <b18af9f1-e3d8-429a-b313-38cc279e0f87@rowland.harvard.edu>
References: <c75433e0-9b47-4072-bbe8-b1d14ea97b13@rowland.harvard.edu>
 <drcvdlw2kpuvsbact2gy4hvqp2i3au3shv5ozp3qms7qdfvi7t@7jofrodxeimb>
 <e3a58c95-9501-4ec8-902e-2a73402d1fe3@rowland.harvard.edu>
 <5rkp3gbrqvsdgia57eyw65jnu4wmpx6sbk47kmv4akmz2q7nzz@clqgtjfk2qxk>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5rkp3gbrqvsdgia57eyw65jnu4wmpx6sbk47kmv4akmz2q7nzz@clqgtjfk2qxk>

On Wed, Jul 09, 2025 at 10:44:35AM +0200, Benjamin Tissoires wrote:
> On Jul 08 2025, Alan Stern wrote:
> > On Tue, Jul 08, 2025 at 05:51:08PM +0200, Benjamin Tissoires wrote:
> > > The second one would need a little bit more understanding of the fake
> > > report descriptor provided by syzbot.
> > 
> > I suppose we can get the information from syzbot if it's really 
> > necessary.  But it seems to be a minor point.
> 
> Well, to me it's important because I can get an easier reproducer and
> add this corner case in the HID test suite :) Not to mention the
> understanding on how we can get to this corner case.

I can get it for you if you really want to see it.  It's just a question 
of asking syzbot to run the reproducer with a patch that prints all the 
report descriptors.

Presumably this is just an ordinary output report descriptor containing 
no fields (or usages, or whatever they're called).  Even if it isn't, I 
would expect any such output report to trigger the bug.

> > > The first byte should always be reserved to the report ID, and is
> > > populated by 0 by hid-core when the report ID is not in use.
> > 
> > Then why does hid_output_report() do this:
> > 
> > 	if (report->id > 0)
> > 		*data++ = report->id;
> > 
> > ?  The first byte is not reserved for the ID when the ID is 0.  
> > According to what you said, the assignment should be unconditional.  
> > Isn't that a genuine bug?
> 
> In my mind, hid_output_report() is doing the correct thing: it fills the
> provided buffer with the data the device is expected to receive.
> 
> However, the HID subsystem convention is that when accessing the low
> level driver, the first byte is always reserved to the report ID, even
> if it's null and should be ignored by the device.
> 
> So I think one of the problems is that __hid_request() should actually
> shifts it's buffer by one in case the report ID is 0, to reserve the
> first byte for the report ID. Likewise, if the report ID is 0, the len
> variable should be incremented.

In other words, in __hid_request() we should change:

	if (reqtype == HID_REQ_SET_REPORT)
		hid_output_report(report, buf);

to:

	if (reqtype == HID_REQ_SET_REPORT) {
		/*
		 * If report->id is 0, the report ID byte is not counted by
		 * hid_report_len() and not reserved by hid_output_report(),
		 * so we have to do those things here.
		 */
		if (report->id == 0) {
			++len;
			buf[0] = 0;
			hid_output_report(report, buf + 1);
		} else {
			hid_output_report(report, buf);
		}
	}

Right?

> > And shouldn't the length computed by hid_alloc_report_buf() be one 
> > larger than it is when the ID is 0?
> 
> Yes, that seems to be correct, but I believe we never had the issue
> because this function already allocates 7 extra bytes for implement() to
> be working (see drivers/hid/hid-steam.c comment in steam_recv_report()
> for a similar conclusion).

Hmmm.  The comment in hid_alloc_report_buf() says that implement() 
operates on 8-byte chunks.  Do those chunks start at the beginning of 
the buffer or at the beginning of the report data (i.e., the second byte 
of the buffer)?  In the latter case the function should allocate an 
extra 8 bytes, not 7.

> I can try to provide a series today for fixing all of this mess. But I
> must confess that I'm currently swamped for the next 2 weeks. Yay for me
> then :(
> 
> [side note: I took the c reproducer, compiled it locally but this did
> not triggered the bug... Given that many of the individual patches from
> the series will potentially fix the bug (multiple layers of fixing),
> it's a little bit sad I can not reproduce locally.]

I can send a patch that does the change shown above, if syzbot's testing 
shows that it fixes the bug.  That ought to help lighten your load.

Alan Stern

