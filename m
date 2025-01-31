Return-Path: <linux-usb+bounces-19909-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C632A243C5
	for <lists+linux-usb@lfdr.de>; Fri, 31 Jan 2025 21:22:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 612167A1C54
	for <lists+linux-usb@lfdr.de>; Fri, 31 Jan 2025 20:21:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6777F1F2C35;
	Fri, 31 Jan 2025 20:22:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="KkuhVC5C"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com [209.85.219.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 680E5156F20
	for <linux-usb@vger.kernel.org>; Fri, 31 Jan 2025 20:22:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738354944; cv=none; b=g2YOGAvbGbfpQOLxBlNOYxSjKZEhvdci52sceCQi4r6qyZ1AQ1HKgJX+NgORricK7ZfvOLZg5MAZ8RAFu0IqAhyKYUeFAlUrZCj+6ZHW2hsEgT8TRBEeovrrnnkRrV+z4P4hz8UmleHRyln0kxGp8EO8VnKDqzf3YiHgYRacAEM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738354944; c=relaxed/simple;
	bh=NxIYu09MV5sZTvScgMAK3mSJi4wIG1e8jOwfyrjHOdI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tT2o8fzYmXEFhyvwQEWvQam6U9VF7CB+q6zFJon4yCA5Cj3dTrqqGNwOoUGDoGTcOqmat5XM5i/2se1ZRunMhgngkpNLuPxwUiGkYPK27mDKeC8O1upZ/0llU9aLxdmksXBhNPMo5FPNVsJg5A9IkBWXssfLvuZ1B7G6E5/aO6A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=KkuhVC5C; arc=none smtp.client-ip=209.85.219.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-qv1-f41.google.com with SMTP id 6a1803df08f44-6d8a3e99e32so21831486d6.2
        for <linux-usb@vger.kernel.org>; Fri, 31 Jan 2025 12:22:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1738354941; x=1738959741; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zEWTa2rARz73z6oAOpI1Z1+YlZ1v+PzEj1VSqxBWsxU=;
        b=KkuhVC5CCdncENZqEkRt66WoIPiGPIlRDCRoJIJJjN8vyBPyKQd8IGrvVxWfKlEKMg
         QMB9kuvzl9yGAWjtHCm2v7/Z6mxktwY85+AzAdgmZaTDrjT0Fm4ontjyjhq+oMtuYaZd
         XG/I9CsfbjF4/VDuWSQxILn9xurle1QGSrO0sXRy1deq/0D6LHG9cSQTEqGSkmbGPi+a
         RKHs7hcjL61zrWg+bgSpJILogGwUqBe1X3UcKmHotitBZA9fyMhu2VaT6a6y873THu0W
         liZEu/0vab7Z88i06Bz5RIGLaI21dYteDzS/r7doPitSVmv0luCrPyiO/6CGzaO7llyn
         QsuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738354941; x=1738959741;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zEWTa2rARz73z6oAOpI1Z1+YlZ1v+PzEj1VSqxBWsxU=;
        b=SiBnDFyHRHKy8tr4/OonRFcXHnCx0KlGJ0owpr2nOREvay8a8iPZDwSfk/byYk4b3K
         Hin0GnvYoc7M0ninKmsr/K9JHN8buAjcYCp9qa02/tUPv9IgcBBUCxqlEJKI/I4AeUeh
         2aIm5KyesuiZMhbOafsUM2/hnlVQcD7K4NMudj7ORRD6XowIl/TcBIrrCBG3WOCn2tgx
         MEtmBBIAICyA2Sf+VtD08WbqkXKJqeGdxy8wk58o2oLuoi1pubXBOdfGgJZocm9EWRpB
         nGyq7Qa5JIR+An9cPEjde1bZWcsJ6cVz6+XaImilJDSX5/5RwoQs/UWEgkdhB+nSgA+r
         bzjQ==
X-Forwarded-Encrypted: i=1; AJvYcCX0lbxpV8dmRlYGBIdhetybl2ldc32BOZgYkRrje6KHuEKV1LkaNeNXYXzxH5N5SdUmbNUsvG7ndSg=@vger.kernel.org
X-Gm-Message-State: AOJu0YydPQ+nWm1HQP4HbIIcN19e+22YFb67oGSBuwfkPELUymH0Qn4v
	57uWLT77O8vQ0+R/+YzbT0F5pUWjHhPB5Sm1akCLAgfTCag1wJlC3Na65uuc3P0Zuk/rG24gqwr
	Qt629B506oI+fY6y52uB80SInbHCfnjJoWPkc
X-Gm-Gg: ASbGnctgt7zhTV3Ko1QYi21sU85Kc6j/LtFsLfbfdt4FPiSVLg4BmSBT5DMGVANgHvG
	iEfQ+CWwNse1juWA7gy/bmPm4ePyfJugiMcGMV4QLqxv9NUSydS7+/vHQVGnc709Y0HFricKzrF
	BqA3uAIvpdzY27D1oBWJV10qFSBLbTUIo=
X-Google-Smtp-Source: AGHT+IH0IVs76Zy9+y8ZTxXDsMBZzpwf+3WKYgDJuETdDYbsxeRTaskKa9TmZKVJXJjwPK9WU5khgI12zA+UTI4Y0vY=
X-Received: by 2002:a05:6214:430a:b0:6d8:aeda:dd93 with SMTP id
 6a1803df08f44-6e243c8fe49mr197426366d6.39.1738354940984; Fri, 31 Jan 2025
 12:22:20 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250122024452.50289-1-royluo@google.com> <20250128014400.7jx4segwn53vjnb5@synopsys.com>
In-Reply-To: <20250128014400.7jx4segwn53vjnb5@synopsys.com>
From: Roy Luo <royluo@google.com>
Date: Fri, 31 Jan 2025 12:21:44 -0800
X-Gm-Features: AWEUYZnoCcCDrQPX9ozA0nR6a5vxAjkn_j0SqNIF_aCUeBSY1sdE3ksoVrg15Ss
Message-ID: <CA+zupgwLfzDvVF+5psdbuUgZb_mCNqXtxS5=b1RtTAjQKq6AuA@mail.gmail.com>
Subject: Re: [PATCH v1] usb: dwc3: gadget: fix gadget workqueue use-after-free
To: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Cc: "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>, 
	"linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"andre.draszik@linaro.org" <andre.draszik@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 27, 2025 at 5:44=E2=80=AFPM Thinh Nguyen <Thinh.Nguyen@synopsys=
.com> wrote:
>
> On Wed, Jan 22, 2025, Roy Luo wrote:
> > `dwc3_gadget_soft_disconnect` function, called as part of
>
> The dwc3_gadget_soft_disconnect() isn't directly part of
> device_del(&gadget->dev). It should be part of disconnect.
>
> Can you provide the full sequence of events so I can have more context?
> The handling of the flushing of gadget->work should not be part of the
> dwc3.


Yes, it's a part of disconnect, and disconnect is a part of gadget unbind.
Let me try my best to explain. Here's the call stack for usb_del_gadget:
-> usb_del_gadget
    -> flush_work(&gadget->work)
    -> device_del
        -> bus_remove_device
        -> device_release_driver
        -> gadget_unbind_driver
        -> usb_gadget_disconnect_locked
        -> dwc3_gadget_pullup
        -> dwc3_gadget_soft_disconnect
        -> usb_gadget_set_state
        -> schedule_work(&gadget->work)

Then when usb_put_gadget is called, gadget could be freed before
gadget->work is executed.
-> usb_put_gadget
-> put_device
-> kobject_put
-> device_release
-> dwc_gadget_release
-> kfree(gadget)

>
> Since the patch above is now in the mainline, may need to add a stable
> tag.

Ack, will cc stable in the next revision.

Regards,
Roy Luo

