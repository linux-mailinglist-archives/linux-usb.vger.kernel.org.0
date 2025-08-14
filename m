Return-Path: <linux-usb+bounces-26874-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 816EDB26C7D
	for <lists+linux-usb@lfdr.de>; Thu, 14 Aug 2025 18:25:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 660AFA037ED
	for <lists+linux-usb@lfdr.de>; Thu, 14 Aug 2025 16:21:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 08C5A22CBF1;
	Thu, 14 Aug 2025 16:21:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="SmRbd1SG"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com [209.85.222.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB16A220F55
	for <linux-usb@vger.kernel.org>; Thu, 14 Aug 2025 16:21:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755188482; cv=none; b=ssGYRItTYskR5QUg24wEiHeVJOxZXLpwLjpUFCEzAdh8vfasfId/8uO57z729m3cmuFbdAjEUIkzyPzm0mR9wKpNZGfAZTTCEbp9JLTLO0CvFbrTh/S7vxrUxvuYxmI41D5a45WPk0cNDBQoWhISfGjAb0445R1MTlXdXzJwjUY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755188482; c=relaxed/simple;
	bh=7EgwnlJAoFTq7SlPhZRA9IsnRZZ93ilNLs8d+YAd+lE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pc0yBCu2O5qqiHe6zKcPe0idhxccxMm/zG9NyPmuX3ak5G9MmLInpNCxjsqq6w378/ywDKPiHvWO+jizw8DVLVVpbhI5I3V5t9A36ytsLbqLE46/gyG7SzqRVPAqMghs6H0HPflHIbBWkmeOuhnEugbR6bgwe4bK7cUyO6STPac=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=SmRbd1SG; arc=none smtp.client-ip=209.85.222.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Received: by mail-qk1-f174.google.com with SMTP id af79cd13be357-7e8704cdc76so108897885a.1
        for <linux-usb@vger.kernel.org>; Thu, 14 Aug 2025 09:21:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1755188480; x=1755793280; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=le3KUTgWjNTixhQays7FLtYINre7Udl52g4ue44pkrM=;
        b=SmRbd1SG8vkzK9HD9zbG7wpfzC3JNWBTUWpiQUUy1f2j94ISV4FNWw6svolmIvhEke
         RQExdM/zDPqf01byjy2U5N4lYfFPGU3OK6djda6niIWRMAFzoSyPsRwg8rH1oGUZeJqd
         KsBKLzKfS5XJdeqkproDv6nMCIoqLddQtI6zJUBUCn0yVhFm/kEPFnsfx6GWaS5jiOiV
         xXOUd/chTVRRLtWiY4gErpCyF4yxr4LB8KLlXru2ZA3n7/pbHmouKQAEOR1V1O4Pr8lp
         ychL51j0Pb2Om6E7qYPGGKRzFvDzsA5u9JlKkp+uMVDJePxrIVArUGaS1qYLucX9+VEX
         QyYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755188480; x=1755793280;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=le3KUTgWjNTixhQays7FLtYINre7Udl52g4ue44pkrM=;
        b=Z3tmfBIaFGkV+fcR7o7iAMjthZKi3cvTT9hTqdaFSc1N92j7IlQoTDc65YIA7ETegD
         vr+F9EQaMEXIjCBpTqkb1pyBc/TPIphr6IE9n2KK8n5R70LaLpwY7RAKKB4EL5u8rPO7
         lB1uFa3i5cfQJBR1w+YmxnD/EcsXvt2mrMtrfqCdZfsndAXxZZK7mY8gCGTrN2ZHAier
         l1a8hwP5aXP3zTA6xaKdx+XCqMp6XBO/L6Z/kI+HOkIbwhxd8F6xIhHfLWKw7AT/ZT0S
         1OBXptHrhxKc0fIzNciOqKAwbMF4xcdsMMZx+EyjwonYCiqME2+9L98ZDBxz6nBK97KQ
         aCFw==
X-Forwarded-Encrypted: i=1; AJvYcCXyOGRCoWs4LReDLv9kSAIdWbNV1Y4lptIBl2HdbRZHb7zL10aEHAP7TAttFIY7tWl+hlCdfHC4Lws=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz8UOAGpYB6v2YjhUsqhvU0x79otrT7dUXg5U3WFKV7lTIdAXCz
	QJQ91IUh2Fz+Kun7/riSqML42ZG8DCErwrIfLy+anwzCXUFe9bYR1OC40jmEsiU/Jw==
X-Gm-Gg: ASbGncu5ksQoI5RqyePIKKnaIkAxD+ZrcyOKgbreQoJAFFkOzXiEnYSk4b+hz9ITShw
	N/IaOe5hnQWrmzCPcJpabm0kzK3T5bXqpwElBOduRXpa2gIDp9Mj2XLhYVmM69qLzT9UooxxzSt
	DxSY+/tuQ1Ig/1vTQfqpxxFFTFeEhKpZq1F60+rK/CB7eBaWx5EMiaNhX4QNAB+f9Oxl16deWcs
	eC3TWgHm7rsRDMkYiUR9ZDSxxRTGgLnCrD9Ohh+qg1H97vLmud6qViwN7T6q1/FiomO62JHvpMy
	Z+9qc+rfWFFbkA5mU5JyxiEsb38aOr4qd+3v6TgsBHdmp9Oy5hZWbn6/vtCEZxuSwmP+DNxUTSX
	lDuyDFUVIA1EGYmm85MRwzJel8U0=
X-Google-Smtp-Source: AGHT+IE6TEt0QdUiRNlKK2ntZI2ZKHaBItsun11sKReyPJdRIak705h7rmhUqMxg6hSEle2xGwwwrg==
X-Received: by 2002:a05:620a:31a2:b0:7e6:9730:3d4e with SMTP id af79cd13be357-7e87057bb20mr438296185a.43.1755188479584;
        Thu, 14 Aug 2025 09:21:19 -0700 (PDT)
Received: from rowland.harvard.edu ([2601:19b:681:fd10::fa48])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7e80c0e6ff2sm1563517685a.30.2025.08.14.09.21.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Aug 2025 09:21:19 -0700 (PDT)
Date: Thu, 14 Aug 2025 12:21:16 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Zenm Chen <zenmchen@gmail.com>
Cc: gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org, pkshih@realtek.com,
	rtl8821cerfe2@gmail.com, stable@vger.kernel.org,
	usb-storage@lists.one-eyed-alien.net, usbwifi2024@gmail.com
Subject: Re: [usb-storage] Re: [PATCH] USB: storage: Ignore driver CD mode
 for Realtek multi-mode Wi-Fi dongles
Message-ID: <b938a764-6ded-4b76-a15c-82c0062abf42@rowland.harvard.edu>
References: <03d4c721-f96d-4ace-b01e-c7adef150209@rowland.harvard.edu>
 <20250814140329.2170-1-zenmchen@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250814140329.2170-1-zenmchen@gmail.com>

On Thu, Aug 14, 2025 at 10:03:29PM +0800, Zenm Chen wrote:
> > Also, can you collect a usbmon trace showing what happens when the dongle is plugged in?
> 
> Hi Alan,
> 
> Today I removed usb_modeswitch from my system and grabbed some data, could you please take
> a look what was wrong? many thanks!

Yes, this shows the problem.  I'll skip the unimportant stuff below.

> D-Link AX9U

...

> ffff8ae1f0bee000 771359614 S Bo:2:053:5 -115 31 = 55534243 0a000000 08000000 80000a25 00000000 00000000 00000000 000000
> ffff8ae1f0bee000 771359684 C Bo:2:053:5 0 31 >
> ffff8ae1b52d83c0 771359702 S Bi:2:053:4 -115 8 <
> ffff8ae1b52d83c0 771359812 C Bi:2:053:4 0 8 = 00007bff 00000200
> ffff8ae1f0bee000 771359853 S Bi:2:053:4 -115 13 <
> ffff8ae1f0bee000 771359935 C Bi:2:053:4 0 13 = 55534253 0a000000 00000000 00

This is a READ CAPACITY(10) command.  It asks the device for the number
of data blocks it contains and the size of each block.  The reply says
there are 31744 blocks each containing 512 bytes (which is unheard-of
for CDs; they virtually always have 2048 bytes per block).

...

> ffff8ae1f0bee000 771366235 S Bo:2:053:5 -115 31 = 55534243 17000000 0c000000 00000615 1000000c 00000000 00000000 000000
> ffff8ae1f0bee000 771366306 C Bo:2:053:5 0 31 >
> ffff8ae218ff2900 771366317 S Bo:2:053:5 -115 12 = 00000008 00000000 00000800
> ffff8ae218ff2900 771366432 C Bo:2:053:5 0 12 >
> ffff8ae1f0bee000 771366443 S Bi:2:053:4 -115 13 <
> ffff8ae1f0bee000 771366556 C Bi:2:053:4 0 13 = 55534253 17000000 0c000000 01

This is a MODE SELECT(6) command.  This one tells the device to change
the block size to 2048.  The device responds with an error indication.

> ffff8ae1f0bee000 771366567 S Bo:2:053:5 -115 31 = 55534243 18000000 12000000 80000603 00000012 00000000 00000000 000000
> ffff8ae1f0bee000 801899370 C Bo:2:053:5 -104 0

This is a REQUEST SENSE command; it asks the device to report the
details of the error condition from the previous command.  But the
device doesn't reply and the command times out.  From this point on,
the trace shows nothing but repeated resets.  They don't help and the
device appears to be dead.

I don't know of any reasonable way to tell the kernel not to send that
MODE SELECT(6) command.

The log for the Mercury is generally similar although the details are
different.  Everything works okay until the computer sends a command
that the device doesn't like.  At that point the device dies and
resets don't revive it.

So it does indeed look like there is no alternative to making
usb-storage ignore the devices.

Greg, do you still have the original patch email that started this 
thread?  You can add:

Acked-by: Alan Stern <stern@rowland.harvard.edu>

Alan Stern

