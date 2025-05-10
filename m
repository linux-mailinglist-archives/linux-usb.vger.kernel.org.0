Return-Path: <linux-usb+bounces-23836-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DEB80AB2476
	for <lists+linux-usb@lfdr.de>; Sat, 10 May 2025 17:53:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0492B1B6505D
	for <lists+linux-usb@lfdr.de>; Sat, 10 May 2025 15:53:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 60F9F21D59C;
	Sat, 10 May 2025 15:52:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="uC382ZoT"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35C032E406
	for <linux-usb@vger.kernel.org>; Sat, 10 May 2025 15:52:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746892375; cv=none; b=ZTHHrXqdHzO+LQm78BIgOuVdrHNuSY5nbph1dV2Qa7ISw5V2VXDwXhgQExMTpoRCCiKI9NO5rLs6DKlsctaBbNzz9LwSgAoaiEnQSeuv5plUqsKqKWgYH5mORaXW1VobL9BXicUv5OYtJlJ12/RFk5BT8yIfzAdL1dfP72pz9qQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746892375; c=relaxed/simple;
	bh=/u97N/wj1nMfr4btuOxEzXl2z5iDGsnXvJ9SLHe+gak=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ktK4m4qgbCx4q0651ZckofEAI+BkfdaUkirhRhWhsU5irvNr8oJ9VdIvZtP+3tEyn4B673c/MX6qs84i6lyOM2AOTC6nSt6stHFlIY5MDB9ivzR6viNijey6gn+oGk0BjMkUNvcXYfgIWGYkib3jcVSgonkKwxe3QNtKKKXx+zA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=uC382ZoT; arc=none smtp.client-ip=209.85.160.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Received: by mail-qt1-f176.google.com with SMTP id d75a77b69052e-476b89782c3so35769241cf.1
        for <linux-usb@vger.kernel.org>; Sat, 10 May 2025 08:52:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1746892372; x=1747497172; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ALI9hBhd3FspKx63OEG6nVH4lLOHhbTyhkJjK/pb+dw=;
        b=uC382ZoTH9suLpEK1T3z/sYv01WbxTHs3Q9leKbc40gfW4VI3cDVMmSg3MJ4FCmeoq
         K6uE+Z+2E5ND+1rxRtAZYuFzT/ksIGG5evK1WjeBegNBGypUWQ8gnwvVF+NxGNJQhNyk
         Ej6F91I/laBaCjJrwBzoUaf4Bm19Q3d5Mk+LCmn/4y18fkxAGXM0MTfNGOBSILQ4CYs3
         anxvvzA7oEBaNaZyk7B7N60pwQICLZ7q4jY6+VCTDz0iSyIpm+tyKjONHS2oF8ja9EeP
         dI+KwajXzAQwLpxKYXA9l5JkJcr5mtzwVBdpx1B8Xuyv8uVFXl+2cJX9s6ggmGMNUKLG
         SD3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746892372; x=1747497172;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ALI9hBhd3FspKx63OEG6nVH4lLOHhbTyhkJjK/pb+dw=;
        b=KRvnMzJRk1Nu5+qqMevxhxtmVTWDw8Di0fo1C8StTF6juoCSIoiawdOBA2kQ2xDHLl
         QbwSrS1xu+29oierIUg0VO4iZxj0+OZeVImnRYGw8Lo0Qm0beeJZKO950kOWXihkYN0C
         EyC70yBqtSgxl5gfzwreaA+HmzkWBkcxbRUCHWL0mJH5fTXMptNPOsLikgDWytYQEuvk
         flM4q1SLV1y+IK1ojh58tnVvIzdLdNv+Vg/TP6c3sf3IZFvmEyVjAN2G8nDI54kf+JTy
         5aTMEcZKhf7lrtJKobNcBPEFgqHcCm8+j+lVY8WFSChVmDmOqFeJqaerDteunDI1BoWT
         XcIQ==
X-Forwarded-Encrypted: i=1; AJvYcCX2mIBGJdZ48WTBNtfBcdkgut5ey+zpZvVYerpbtHn4wUHblxSjaP82MIM75e5m8PIJvDbeZsSrdQU=@vger.kernel.org
X-Gm-Message-State: AOJu0YwKfzP/5db20uIanjQ1LxCGsCrAxe/9wQcNcfp8WoGii5ij30Z7
	R3h3ABHlaPjbTCRFmf0e5fiuWEdLz2KO6fcuS9yG+EuFPMkKZX1b84CfJdhTxQ==
X-Gm-Gg: ASbGncvH2nEFkjkTC40yTxYKyfXndfeYuk1MDnEby4GiYrKNTVwvLdgwCMYRwcACS/A
	o6sriMstt6PHpQJ3RH6nkZ1elJTf/56px+unn8raxkv7p9NvBpebcOpqicZ1M/VrjSkko0LQaM0
	kwzdQE/CDWn6f3/vC88TYSQqE3vTQ77D+OPF1eJWCIPq8n5lWPrzeay/8QHplrdnc+XfldpT2nt
	7klRbITI0wvhPE10jBILMwmQRWHOdfpxeblUUGt5HAKTIFpZmP/EeLgNnQ8IsdRJtIpCMirkgDp
	zkn68WGJPiOtg3OIjl6Ne1ec0ml6/EJQ4rAuNp7y7twSBhVZJIWTKIYRhFg/3eU=
X-Google-Smtp-Source: AGHT+IEBSgSgnDlOvblRsUAqqLJe+1hkCE5bWUJR675W2vhCBR2fkBv2fpZCXsVl3RZSroMD1CYtCA==
X-Received: by 2002:a05:622a:30d:b0:48d:d63d:d61b with SMTP id d75a77b69052e-49452762512mr112156791cf.25.1746892371941;
        Sat, 10 May 2025 08:52:51 -0700 (PDT)
Received: from rowland.harvard.edu ([2601:19b:681:fd10::3baf])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-494524b7184sm26272351cf.33.2025.05.10.08.52.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 May 2025 08:52:51 -0700 (PDT)
Date: Sat, 10 May 2025 11:52:49 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: =?utf-8?Q?Micha=C5=82?= Pecio <michal.pecio@gmail.com>
Cc: Niklas Neronin <niklas.neronin@linux.intel.com>,
	Mathias Nyman <mathias.nyman@intel.com>, linux-usb@vger.kernel.org
Subject: Re: Problematic Set TR Deq error handling series in xhci-next
Message-ID: <65ac6458-1f64-406a-8ccc-0e516dc0c14e@rowland.harvard.edu>
References: <20250509114138.7052dd3b@foxbook>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250509114138.7052dd3b@foxbook>

On Fri, May 09, 2025 at 11:41:38AM +0200, Michał Pecio wrote:
> Hi,
> 
> I noticed that xhci/for-usb-next now includes a series which tries
> to handle Set TR Deq errors. It strikes me as a solution looking for
> a problem, and frankly creating new problems where none existed ;)
> 
> I am aware of three cases leading to errors being handled here, and
> none of them is addressed. One is harmless and easy to fix properly,
> but this series appears to turn it into a "never give back the URB"
> disaster. Tests pending, I hope to find some time this weekend.
> 
> There should be no need to handle these errors, they are prevented
> by not queuing the command in wrong states. When the command fails,
> it means the driver screwed up tracking endpoint state and other
> things are on fire too, so the actual bug should be fixed instead.
> 
> The case of disabled endpoints is clear: no URBs are allowed, the
> core is broken. It would be more productive to sanity-check core:
> detect and nuke lingering URBs in places like endpoint_disable(),
> drop_endpoint(), reset_device(), free_dev(). If Set Deq is already
> pending at the time, give back the URB and let the command fail.

The core already does this for endpoint_disable.  If the others have 
problems, could you provide a tracebacks so we can see the pathways 
where the problem occurs?

Alan Stern

