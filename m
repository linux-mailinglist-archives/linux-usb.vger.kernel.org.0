Return-Path: <linux-usb+bounces-21981-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AC93A6ABE9
	for <lists+linux-usb@lfdr.de>; Thu, 20 Mar 2025 18:26:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1B70E179B73
	for <lists+linux-usb@lfdr.de>; Thu, 20 Mar 2025 17:25:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 544D5224B02;
	Thu, 20 Mar 2025 17:25:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="qkbRn6Dh"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com [209.85.160.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2996B223301
	for <linux-usb@vger.kernel.org>; Thu, 20 Mar 2025 17:25:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742491511; cv=none; b=SKtnbmtJkBH7tvFn5SJgf5dqGpLBntBwYUI58AIRZB0JkKfz+O+tBfSTUoK8F+l0mnvDTJ5b3wNcRDT+DZ+rJscplw04ubkTU98iB45IZtGOPjKiWEm5VOXQ6vLvnwjljTNpofEq0sVKcln1x/GYw0JnA1aO5GAlLgtEabYXQ+Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742491511; c=relaxed/simple;
	bh=fzQUX0TFLfebdWmZqTcvsgkqfZ3xX/aDgewmGQBJNIo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=k7bmZidvM1bB0WRIr+hB1RbyFekOzzTzsFacT6nU3OulXFeiZUs0zPzit4Ih0fmCCs9hBeCDha5yaKBtYtZsnvC+oyG2grEmDvBqXljSu/wQZ6pPfAOTRLePB6Nm4agKafvp5QBw0jm9dCXgpo5KBtcVhTz+tAMfZaqOe3eO6IU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=qkbRn6Dh; arc=none smtp.client-ip=209.85.160.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Received: by mail-qt1-f179.google.com with SMTP id d75a77b69052e-47690a4ec97so10987371cf.2
        for <linux-usb@vger.kernel.org>; Thu, 20 Mar 2025 10:25:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1742491509; x=1743096309; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=rL6DebdLzScpxUUXc1Xt4tJ87WZ47vTIBhRO5NkDR0k=;
        b=qkbRn6Dh1rwGxMQnmmMYO2yYtosiMaoo2b+GAl067EsMQpqokDV2cpJDZfANaJnAYp
         I8bI+Dv1VRblY+vQyGoiReTtbsxeaYApRdcfzs5KMZ2vWlL2D3XglvGtXNo0JV0zDKbU
         cEMnSGYvBXcgrwKR0wTbQWAFm8Tcij1GdvXNYN7xynShfpiwlRcKh6hXvjs9jlGlbudC
         YhJkPtt/h+56lD08WjjwUA/AYSVkDnvfsjyOLi4K6g4V8F8ggo6/aQS+sQ7n3KLMJVwr
         08ILmdrjgIz74lByPwK8CkZLA0uG+mKFCoiSbPcV4t6iiXxiDkrQEnOQJCtESKmY7+0g
         +gAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742491509; x=1743096309;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rL6DebdLzScpxUUXc1Xt4tJ87WZ47vTIBhRO5NkDR0k=;
        b=hT45Ofj+9Zue8Z9+5l5KxyEO/GINN5x7+38rag/nTeYBbNQTVw7s5JymrfRazGYrGX
         +AikG2fE/LmD2tzfMSjSm9KAs4YLei1gL3tjmJyJ2F8A6V90kyyP7NBqxAS90ECREvh2
         Zn83DaloU4QSe6/2JI9rjKuDYSFiShtV6boQms9Jo9YIeupkJ1tkQzU5Mr/1tW6Tweck
         L247WU9G9A8efP5MMf1v0qtl/X8hhkqUh1s/6201YzK30EBfjYe+2iBBiCcfEk/oXSv+
         93N5cOzk9+iQa+gwIUKBmaOYOIMM7Y19faGJ+iALDbY63mpZvmytpe9srTY40NKCLF5G
         w8PA==
X-Forwarded-Encrypted: i=1; AJvYcCU2FULXYPl2InbXfcOQAmnxcPHcdNsqB9UCf61j4+eSk6cb1e3KvpNkLIyyBltRKDWODapzgsYVDmw=@vger.kernel.org
X-Gm-Message-State: AOJu0YwdEMlrR50VbPPc8XrXTRPAwOHvT6SW3j/MY2moC5ljv18FY7XE
	ofcL+aXW3/gJvFbMHr2XORjy/IpmYME84/4ZNjlcmkZPBRB+Dhecd2/gl5W8Yg==
X-Gm-Gg: ASbGnct/F727FMhwkfJPlAf/hPaqfEgVgg51TobdTk7G6YQVlNGCmvXfAQwPNKi7bEq
	OBJxZyBsxHtP8Wlt6u8OGMdCKgw3I1m985gEUSu7C4KqhUsXZdi0tjL/wYj3cSH8f1Hq1P2jwzn
	Hvj22Jfx4LKbBBQ9ZYJNuYs589VOEFGRRYYh7KLhT5AqhkNvnzzMHsUU/kzELI6PS7Xj+zt1RsB
	2Yaw3nL6qJrrxqIKL2iuqjAWew9cbeC7RmsgwBAbfvi0KVy3vGNFbh1cz/WvCI5WMoTJvT1r+1s
	OBtAQoIKiCiUzkBcXDq3uLbXAhrxYCS27rZ5M8mrapP8Wdf7bx3f5XU896iaE5miwTaaiUeyBKj
	cQwKBdOxmQNSJuDamlvBleMJR4N6bKEyOB+Edgg==
X-Google-Smtp-Source: AGHT+IHgyRoJU+sQRfaKBvGkDtBulGCQxmx3ELr3PVJnr/FpuA7LHLyshb2Ty3ZfruL2JeE7d0BUVg==
X-Received: by 2002:a05:6214:1c0e:b0:6d8:af66:6344 with SMTP id 6a1803df08f44-6eb3f27f541mr4060236d6.2.1742491509066;
        Thu, 20 Mar 2025 10:25:09 -0700 (PDT)
Received: from rowland.harvard.edu (nat-65-112-8-24.harvard-secure.wrls.harvard.edu. [65.112.8.24])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6eb3efc6018sm820456d6.86.2025.03.20.10.25.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Mar 2025 10:25:08 -0700 (PDT)
Date: Thu, 20 Mar 2025 13:25:05 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Oliver Neukum <oneukum@suse.com>
Cc: =?utf-8?B?55m954OB5YaJ?= <baishuoran@hrbeu.edu.cn>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Kun Hu <huk23@m.fudan.edu.cn>, Jiaji Qin <jjtan24@m.fudan.edu.cn>,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-input@vger.kernel.org, syzkaller@googlegroups.com
Subject: Re: WARNING in cm109_urb_irq_callback/usb_submit_urb
Message-ID: <07f2ec1a-0363-4734-97ff-a129699b1907@rowland.harvard.edu>
References: <559eddf1.5c68.195b1d950ef.Coremail.baishuoran@hrbeu.edu.cn>
 <62d91b68-2137-4a3a-a78a-c765402edd35@suse.com>
 <a3f66f2e-a99e-47f2-a3ef-742b6903cc5d@rowland.harvard.edu>
 <7be81186-2d18-4d0e-8a93-d2dda20b02b2@suse.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7be81186-2d18-4d0e-8a93-d2dda20b02b2@suse.com>

On Thu, Mar 20, 2025 at 04:42:33PM +0100, Oliver Neukum wrote:
> On 20.03.25 15:25, Alan Stern wrote:
> 
> > This test must itself be subject to the same race, right?  There needs
> > to be some kind of synchronization between the two tasks (i.e., a mutex,
> > spinlock, or something similar).
> 
> Hi,
> 
> there is:
> 
> static void cm109_stop_traffic(struct cm109_dev *dev)
> {
>         dev->shutdown = 1;
>         /*
>          * Make sure other CPUs see this
>          */
>         smp_wmb();
>         usb_kill_urb(dev->urb_ctl);
>         usb_kill_urb(dev->urb_irq);
>         cm109_toggle_buzzer_sync(dev, 0);
>         dev->shutdown = 0;
>         smp_wmb();

I don't know anything about this driver, but the placement of the second 
smp_wmb() looks odd.  Should it really come before the line that sets 
dev->shutdown to 0?  In general, smp_wmb() is used to separate two sets 
of stores; if it comes after all the relevant stores have been performed 
then it won't accomplish anything.

> }
> 
> This driver has a tough job as the two completion
> handlers submitted each other's as well as their own
> URBs based on the data they get.
> That scheme is rather complex, but as far as I can tell correct,
> but you need to test that flag everywhere.

However, it's quite noticeable that the code you want to change in 
cm109_submit_buzz_toggle() doesn't have any memory barriers to pair with 
the smb_wmb()'s above.  Shouldn't there at least be an smp_rmb() after 
you read dev->shutdown?

As long you're updating the synchronization, it might be a good idea to 
also improve the comment describing the memory barriers.  "Make sure 
other CPUs see this" doesn't mean anything -- of course all the other 
CPUs will eventually see the changes made here.  The point is that they 
should see the new value of dev->shutdown before seeing the final 
completion of the two URBs.  Also, the comment should say which other 
memory barriers pair with the ones here.

Alan Stern

