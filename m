Return-Path: <linux-usb+bounces-25433-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 77E07AF69D8
	for <lists+linux-usb@lfdr.de>; Thu,  3 Jul 2025 07:40:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B567D1C28026
	for <lists+linux-usb@lfdr.de>; Thu,  3 Jul 2025 05:40:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2373028FFFB;
	Thu,  3 Jul 2025 05:40:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=iiitd.ac.in header.i=@iiitd.ac.in header.b="WT2Gsbez"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 971602DE716
	for <linux-usb@vger.kernel.org>; Thu,  3 Jul 2025 05:40:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751521225; cv=none; b=QHvxx8vSAQfd060Xd6OwWec2YohVrushAiwFd1yfzCj7EogbLq0tidUhnY154iFMe0/jBRPbXrLo/YDjoAIG55huRuhaUkK5fwPzUDB3SgYZXz+16xBw+x4tTZGArNaQQLhLAXGp4XqRfld3F8wNRCILbCc+aWuokC5cFVJBtno=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751521225; c=relaxed/simple;
	bh=M2vyeWH0DutHMkqV6DcIyt6SCatd8hktuKbQTf/JtJo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=i7R3JQRIV1asg2UV6N2D7vYOrCZxb8/N0ePAEg6Rtcqn6Hm+fva37xB1RHQXqbGgcfCgZ5CrRfRVWM+9PHYi/NlFBp89t0NmGu1KhZpvLCWaZ1e4LP79dbuqDCVNhFhdeF33B3nHPSd7mQZMXUpgN+Uom1Lsc0yqpxBmAntaCuQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iiitd.ac.in; spf=pass smtp.mailfrom=iiitd.ac.in; dkim=pass (1024-bit key) header.d=iiitd.ac.in header.i=@iiitd.ac.in header.b=WT2Gsbez; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iiitd.ac.in
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iiitd.ac.in
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-7490cb9a892so5324732b3a.0
        for <linux-usb@vger.kernel.org>; Wed, 02 Jul 2025 22:40:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=iiitd.ac.in; s=google; t=1751521222; x=1752126022; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=eZJ3D9BdUXcaieDRgLM5GSqlyr9PlwsCgm1po43FpSQ=;
        b=WT2GsbezdQf77UVJV+TskuYfnEfbdpB4SxncHPvGB06PzpVNgVADpP/2oo3hJvgD+k
         d6QzF8HAUHW0IW4vVCwFrM59KPKyfvLE0y/t+tGxKQIRGMQfUzjc5DV2KHI4SbKakVds
         /U+/hTKjJslVFAvLA300KMQZsv1aRAcBhx5uI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751521222; x=1752126022;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eZJ3D9BdUXcaieDRgLM5GSqlyr9PlwsCgm1po43FpSQ=;
        b=RZqeufst0LcwBBvqRKdsY7Q/lEc+sIabwshvhifBjB7+eIoQCBaMk1nuWBAEgKzPVR
         zZRxW84lJSDnk6evbc2GiMdz34Khnc5M2uVl/4VPjfmun/rvOY++zFzE/u5u01E71RVD
         cwgvx7kTF1FgP9QepZmbeJ/0LXVb3fjA1/qyxA8I1JycLwgQAAW+i1r8Z8WFbNgS8S1T
         PybFqWhih+R3Jyk39T4yY+han9SETxtgh4wpgMsv/U6zWNOpoDXyQXsmBtXHxAKp2b2m
         hKWBF2X3oHnWGS3OdJns1ZUGPixHZqWP5vIYUu4lPE3J/PGD+Nl/r9Dl1vPkwBsWIcbS
         PYiA==
X-Forwarded-Encrypted: i=1; AJvYcCU/dhHzRE+qhwXzXDvPH1pWuML/EHb3Ei//0zZXMaEM5gDEkMfiyMbf3nvaKeAdz6UFqNbMCBHlyRc=@vger.kernel.org
X-Gm-Message-State: AOJu0YyJY9oasX9aaHiAEZY3C8F9o+oNEVuRU3MFEgOGmJyoD5FU4wNF
	bh3WjR8EoVQDDv/3ea1R+SBslS7liX0cgvoB5T8Hwh3BtNYM46ygZSBHn6NmpTSy1ZY=
X-Gm-Gg: ASbGnctKcUfBGEmty3JPFathsIV2pri11fgENwI+1NV5hrf9fqAD0wb3TOKeLOHwM3N
	ABbDo/N87OJmtSYEEOUfN6ZYLmGFfB7hLsL3DQ4HEF4K4/CHjq2zcPAeQZdr9cMkVLB3C640ttX
	acrcas0TmTeFQ3P+6YQLXXCyoZby0mqOatPb+XtCNHozSi9bd93ibiG0hDDHe1x0xP1eoN06Qr7
	Oa3Xq9zV8XYKDtfIJvnyzPw4HplLDAVwxk9o82YbeCsa105jXYZS3yVYXBeowPbLVKiN68dzwYm
	n0E07Ya8DNxmH0zL2+yRx6FswLNENBHQkAatdTe4/6uSuBxv5Sc6N0Ro
X-Google-Smtp-Source: AGHT+IHBqMwtweqX9zHJzqYFxoWDjzmtyx2Umni0voQWk/BC+z7nOVvDheUtLCx8ITkinSUCSdPYgg==
X-Received: by 2002:a05:6a00:2354:b0:748:fb2c:6b95 with SMTP id d2e1a72fcca58-74ca8495056mr3197822b3a.18.1751521221899;
        Wed, 02 Jul 2025 22:40:21 -0700 (PDT)
Received: from fedora ([103.3.204.95])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74af58068b6sm15774866b3a.175.2025.07.02.22.40.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Jul 2025 22:40:21 -0700 (PDT)
Date: Thu, 3 Jul 2025 11:10:14 +0530
From: Manas <manas18244@iiitd.ac.in>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Alan Stern <stern@rowland.harvard.edu>
Cc: Pete Zaitcev <zaitcev@redhat.com>, Paolo Abeni <paolo.abeni@email.it>, 
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Greg Kroah-Hartman <gregkh@suse.de>, syzbot+86b6d7c8bcc66747c505@syzkaller.appspotmail.com
Subject: Re: [PATCH] usbmon: Fix out-of-bounds read in mon_copy_to_buff
Message-ID: <uew7bu3uxpppew5bhnpzw2oiqyrzv64co54fjthwnhqtnybv6o@lh5pzvkubzo3>
References: <20250703-fix-oob-mon_copy_to_buff-v1-1-1aa7f5723d91@iiitd.ac.in>
 <2025070322-overstay-compacter-3544@gregkh>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
In-Reply-To: <2025070322-overstay-compacter-3544@gregkh>

On 03.07.2025 07:12, Greg Kroah-Hartman wrote:
>On Thu, Jul 03, 2025 at 02:57:40AM +0530, Manas Gupta via B4 Relay wrote:
>> From: Manas Gupta <manas18244@iiitd.ac.in>
>>
>> memcpy tries to copy buffer 'from' when it is empty. This leads to
>> out-of-bounds crash.
>
>What exactly is the "crash" that you are seeing?  What is reporting it,
>and how?
>
Hi Greg and Alan,

I ran the reproducer[1] on my machine and got the following stacktrace.

```
[   41.601410][  T769] ==================================================================
[   41.601908][  T769] BUG: KASAN: slab-out-of-bounds in mon_copy_to_buff+0xc6/0x180
[   41.602405][  T769] Read of size 832 at addr ffff888043ee6081 by task kworker/0:2/769
[   41.602898][  T769]
```

which led me on a different path. I assumed that out-of-bounds was occuring in
`mon_copy_to_buff` without realizing it may be the caller at fault, as Alan
pointed out in his feedback.

I now notice that my stacktrace is also slightly different (or rather
incomplete) as compared to the syzkaller report which says

```
BUG: KASAN: slab-out-of-bounds in mon_copy_to_buff drivers/usb/mon/mon_bin.c:252 [inline]
BUG: KASAN: slab-out-of-bounds in mon_bin_get_data drivers/usb/mon/mon_bin.c:420 [inline]
BUG: KASAN: slab-out-of-bounds in mon_bin_event+0x1211/0x2250 drivers/usb/mon/mon_bin.c:606
Read of size 832 at addr ffff88802888f1e1 by task kworker/0:2/979
```

where it does mention that the issue is in the caller. The caller must ensure
the correctness of write buffer.

Also, Hillf has produced a patch [2] which looks better than mine.


[1] https://syzkaller.appspot.com/text?tag=ReproC&x=1770d770580000
[2] https://lore.kernel.org/all/20250703043448.2287-1-hdanton@sina.com/

-- 
Manas

