Return-Path: <linux-usb+bounces-19269-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 849FBA0BF9A
	for <lists+linux-usb@lfdr.de>; Mon, 13 Jan 2025 19:12:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9AB2A1887759
	for <lists+linux-usb@lfdr.de>; Mon, 13 Jan 2025 18:12:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B2E961BEF9B;
	Mon, 13 Jan 2025 18:12:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HuYsxYbE"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DB5E1B4135;
	Mon, 13 Jan 2025 18:12:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736791940; cv=none; b=cfCtkIkjitW4qUR9Lyu/5kN5tZ/rN7F/J06u1+xObFufKOYTRl5a9OtJqpdRm72cwVgmjMS86fDXwre1koRl3+229knw4eoWYyyhbCRohCkJ7RILLMJ83HBOue51p8P2ojcCtd8w+NGmJCAiTo/S8sszTsjqG5+4zPJXdP75XvY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736791940; c=relaxed/simple;
	bh=kP4Gga7mGVibvP4dNnsEimXPJMh7K4xqoldUfvkaHBk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=CSfF7R/qvcrOA9tmOWMAMVFSS83X/lU4RO3btvkUpM/+55SX5gPwrs078YaHv5nGLzNSX1pZE/wqYrJja9iFtgC2sjb+M2TjDMdyBiIJTlr3gY85cnffIRFogjZ4WZ672PMTxPNbqr7yTgGiSxqQ8My0eOhifpqpHa/ogdocIEg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HuYsxYbE; arc=none smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-5d96944401dso7788598a12.0;
        Mon, 13 Jan 2025 10:12:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736791937; x=1737396737; darn=vger.kernel.org;
        h=content-disposition:mime-version:reply-to:message-id:subject:cc:to
         :from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Dp6ZU7z8bRDseXmAFJ5IuIyl4NKsROAdL2p5GgpSpjw=;
        b=HuYsxYbEf+d2+ECKT4cEt80GJW3K27Gftuv5RTJ/CHl7Jc9sO1V7qI+haww3pRg6PH
         jGqZ8PvQFBK0dda+NMWkCMDeZ55Y3WntXtkxsKWKoGngraogTsQy0P5vsfksuBoa1v8L
         t+KLMF3Izb5Tk25H6mlyfFc++xISyBQnFjWneHgqafGukT1ylHweK6As1BjkkegSrH5K
         qG/K1caJrsCb7OLMZL642RDnKZXXj5uPXzS69M0Xps3mGe5IfK9hN27+M3VvjDK576pD
         /OsdKWCDBeZIk44JG+qIgfGSLzhpvXcGZF5KBQCNqUGScb4LoKuiim3J7Z2TnWUQhK/j
         Xjxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736791937; x=1737396737;
        h=content-disposition:mime-version:reply-to:message-id:subject:cc:to
         :from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Dp6ZU7z8bRDseXmAFJ5IuIyl4NKsROAdL2p5GgpSpjw=;
        b=rsoQP0x34KNgTca5H8gjFUOYcemTs4pqBxvZIrZ8ooOvgD/yVEukEq/g/ypGEKZp9W
         D9HX6abFw02FBRDDRqBGhkMKWT1yW47P6DxAp2rDEjSMTXVtW6vHfqO81oK013RU50Rg
         yknx15ttIPx7TS4PcV7lPSKfceGNE7p8pQ8DFEECnOxLAiWWP/A7LAXZoDYTTWyQx2cO
         Cfm1p46OAc/vhmiLZadR4iGsNftNMCsa4xCWxIEuhfU3oXJw+4d0GkCWA6hjV8dI5QPI
         yZS4xTtatRS+D96jHmV98NgqE6eHA8/tA38XPF4amL2559bHRxPfC6PnXYHhst6OM0eU
         tkdg==
X-Forwarded-Encrypted: i=1; AJvYcCW11bVp74gm2yPyvZPBLegigQmnD4RlJIiwiCVOo05Tw5S/XIoruXIQqz31Nc9x6U2Vd6L7shtEei1gBf4=@vger.kernel.org
X-Gm-Message-State: AOJu0YxJ4oepsHDdlSnENABO8D5VQlFICV9TRUzqsj6eAogodEBSoAv+
	ZwdB0qZScAuu/FyXNXHnNSoQWO4S9WkoTsbB+Y33vlYvPLoVzwtB
X-Gm-Gg: ASbGncsNHHH0OW7Nd+8xkJPRAXhhA4sQZCWM8mn4f78S0wVZcXhCq0IysDjtcfWImhZ
	Gw6NTbeAyNAkNxlcCsj/XEIzQYtK0vu/MYqhTCiezKiIxSpLhwz/FZmWPXZ3J0YLAuvY4ADkjcK
	6b5FQ/GxoCAsHq70Ig31tzJFS7/AQSYb240Bkq54hGOjCMuEdmLMZJu9LvrzIHvYeOYmlV8yHMW
	yDx52OiLFbN1rxfjt9YDj1kFZIkfnjAvdC+TPROg7zIo4Np/sOgN03QNDrZ
X-Google-Smtp-Source: AGHT+IFI3cqZvPbbtx3pyX6mm51fZ/W7pF5RAH4056zaGAz2zpPoC3LkZ/UBS7qzZ8jXIRBb3MoArQ==
X-Received: by 2002:a05:6402:5254:b0:5d3:fc60:a504 with SMTP id 4fb4d7f45d1cf-5d972e17891mr20410077a12.20.1736791936746;
        Mon, 13 Jan 2025 10:12:16 -0800 (PST)
Received: from qasdev.system ([2a02:c7c:6696:8300:b223:13ea:b85b:4f5c])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5d99008c294sm5212703a12.15.2025.01.13.10.12.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jan 2025 10:12:15 -0800 (PST)
Date: Mon, 13 Jan 2025 18:12:01 +0000
From: Qasim Ijaz <qasdev00@gmail.com>
To: Johan Hovold <johan@kernel.org>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH v2] usb: Fix null-ptr-deref in qt2_process_read_urb()
Message-ID: <Z4VXcZLcFxA8AQ-b@qasdev.system>
Reply-To: Z4TWIs1fCmVLraBa@hovoldconsulting.com
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Jan 13, 2025 at 10:00:18AM +0100, Johan Hovold wrote:
> On Sun, Jan 12, 2025 at 09:55:58AM +0000, Qasim Ijaz wrote:
> > This patch addresses a null-ptr-deref in qt2_process_read_urb() due to
> > an incorrect bounds check in the following:
> 
> Thanks for the fix. This looks correct, but your patch is whitespace
> damaged (tabs replaced with spaces) and does not apply.
> 
> Can you please fix your mail setup and resend a v3? (Make sure to send
> it to yourself first.)
> 
> When doing so, please use the common patch prefix for this driver:
> 
> 	USB: serial: quatech2:
> 
> > ""
> 
> You can drop these (markup?) quotes.
> 
> >        if (newport > serial->num_ports) {
> >                dev_err(&port->dev,
> >                        "%s - port change to invalid port: %i\n",
> >                        __func__, newport);
> >                break;
> >        }
> > ""
> > 
> > The condition doesn't account for the valid range of the serial->port
> > buffer, which is from 0 to serial->num_ports - 1. When newport is equal
> > to serial->num_ports, the assignment of "port" in the
> > following code is out-of-bounds and NULL:
> > 
> > ""
> >        serial_priv->current_port = newport;
> >        port = serial->port[serial_priv->current_port];
> > 
> > ""
> > 
> > The fix checks if newport is greater than or equal to serial->num_ports
> > indicating it is out-of-bounds.
> > 
> > Reported-by: syzbot <syzbot+506479ebf12fe435d01a@syzkaller.appspotmail.com>
> > Closes: https://syzkaller.appspot.com/bug?extid=506479ebf12fe435d01a
> > Signed-off-by: Qasim Ijaz <qasdev00@gmail.com>
> 
> And please include a Fixes and CC stable tag:
> 
> 	Fixes: f7a33e608d9a ("USB: serial: add quatech2 usb to serial driver")
> 	Cc: stable@vger.kernel.org	# 3.5
> 
> Johan

Hi Johan,

Thank you for your feedback on the previous version. I've sent the v3 patch addressing the issues: fixed whitespace damage, removed quotes, updated the prefix, and added Fixes and Cc tags.

Best regards,
Qasim

