Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6A1BA21AEA5
	for <lists+linux-usb@lfdr.de>; Fri, 10 Jul 2020 07:29:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727822AbgGJF3P (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 10 Jul 2020 01:29:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44238 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726907AbgGJFYE (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 10 Jul 2020 01:24:04 -0400
Received: from mail-qv1-xf42.google.com (mail-qv1-xf42.google.com [IPv6:2607:f8b0:4864:20::f42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 48EE8C08C5DD
        for <linux-usb@vger.kernel.org>; Thu,  9 Jul 2020 22:23:54 -0700 (PDT)
Received: by mail-qv1-xf42.google.com with SMTP id di5so2036606qvb.11
        for <linux-usb@vger.kernel.org>; Thu, 09 Jul 2020 22:23:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:references:in-reply-to:subject:date:message-id
         :mime-version:content-transfer-encoding:content-language
         :thread-index;
        bh=JOxvsjTtrIn1ul+ykPQQxrwHznpDvG3mHfj00NnKqR4=;
        b=QBVCfuNo7yMD6J43dyU9nNEzLW2NoKT4G4T+a06H7MW4VX0lvKciZVtPND+ivWrWE0
         woucox+zoI3xrcSVCSSSnbkELewzPhd47iI3Opc50ZZnoSebIabcSpm936Nmpgi01vE4
         WrDBPv8spqjEy+f4PVbC57/GU4FUIu4ilzHhD43B4y1IO2py8d+FEIdj2l0RFHgZjXsl
         88RLC5YM+ysaEaCQX+SzXkSEODU3YVghryWa84dSk8ylEdzltTteCbdmf4TbPxlywuhp
         3RRtdhID8YVWu39Pw3EsfGHS+x8hpEAfaFoKvC5k6qP2/CT722fcco59h+d1S8BoNBQg
         h7/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:references:in-reply-to:subject:date
         :message-id:mime-version:content-transfer-encoding:content-language
         :thread-index;
        bh=JOxvsjTtrIn1ul+ykPQQxrwHznpDvG3mHfj00NnKqR4=;
        b=mNnRYJx+R9nEckbyajCGZTewAhr+TGBQ7GEqZkXL20kjwPGRuSXcf/RQsQkV6I2cV5
         hf4fkUv2Vgf0iq6uefk6nRWqIrBTsqh+3klMiQio4t5/b/i4wvzJnvJRXJfyxUZc4tph
         cxBHimy/+kdVsN1NzwEp4Lr08rDUUAS+acb8NX7ktpuMZxrnXzOfbo6FOeDN2gnCwqkK
         ImMicD9/uHQT31h6TMieLkRDAL3JV/1vWY5F3oCWB+5J3pWerBMJvw/SNUcQ4FvxpEMX
         lZ7Rhzz0QbIbF6WwMwwsOxaBWHuSbmsVRst5GF37j64Q2EwuxLXLQsEtU5OjOXcLQUyk
         FsLA==
X-Gm-Message-State: AOAM531U/DUnTvuMLpVpnv4B0+1cJvEdcXm6raVuDCV/Ft9xVzoYLRRX
        WC3snbVv7iDQ3hf++FVUciypnoy2FcJJzA==
X-Google-Smtp-Source: ABdhPJw8r5RDEA2Se9OeEk7+zSqu9FTs0Zva8N+rAgzBRLlvP6Vr+ZrvhX8Sx+iaGLb/N5XeNSiKuA==
X-Received: by 2002:a05:6214:328:: with SMTP id j8mr51287253qvu.75.1594358633559;
        Thu, 09 Jul 2020 22:23:53 -0700 (PDT)
Received: from DESKTOP2I1VNC3 ([209.94.140.104])
        by smtp.gmail.com with ESMTPSA id b7sm6170714qkl.18.2020.07.09.22.23.52
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 09 Jul 2020 22:23:53 -0700 (PDT)
From:   <charley.ashbringer@gmail.com>
To:     "'Greg KH'" <gregkh@linuxfoundation.org>
Cc:     <linux-usb@vger.kernel.org>, <thomas@winischhofer.net>
References: <1593200057-245-1-git-send-email-charley.ashbringer@gmail.com> <1593200057-245-2-git-send-email-charley.ashbringer@gmail.com> <20200627112828.GA1596272@kroah.com>
In-Reply-To: <20200627112828.GA1596272@kroah.com>
Subject: RE: [PATCH 1/4] USB: sisusbvga: change the char buffer from char to u8 for sisusb_write_mem_bulk and sisusb_send_bulk_msg
Date:   Fri, 10 Jul 2020 01:23:52 -0400
Message-ID: <09b501d6567a$4d7dd7a0$e87986e0$@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain;
        charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Content-Language: en-us
Thread-Index: AQKNMnFy5Qx2eb2+Rjx7V8DdwOUohAIg0o+mAdBBEIuncwCGAA==
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org



> -----Original Message-----
> From: Greg KH <gregkh@linuxfoundation.org>
> Sent: Saturday, June 27, 2020 7:28 AM
> To: Changming Liu <charley.ashbringer@gmail.com>
> Cc: linux-usb@vger.kernel.org; thomas@winischhofer.net
> Subject: Re: [PATCH 1/4] USB: sisusbvga: change the char buffer from char
to
> u8 for sisusb_write_mem_bulk and sisusb_send_bulk_msg
> 
> On Fri, Jun 26, 2020 at 03:34:14PM -0400, Changming Liu wrote:
> > This patch changes the types of char buffer declarations
> > as well as passed-in parameters to u8 for the function
> > sisusb_write_mem_bulk and sisusb_send_bulk_msg to aviod
> > any related UB.
> >
> > This patch also change the local buf[4] of sisusb_write_mem_bulk
> > to u8. This fixed an undefined behavior, since buf can be filled
> > with data from user space, thus can be negative given it's signed,
> > and its content is being left-shifted. Left-shifting a negative
> > value is undefined behavior. It's fixed by changing the buf from
> > char to u8.
> 
> In looking at this closer, it doesn't make sense to change the function
> parameters here, as everything that deals with the pointer already
> handles the change properly.
> 

Quite,  no security issue could possibly be raised without 
these unnecessary changes. 

> 
> >
> > Signed-off-by: Changming Liu <charley.ashbringer@gmail.com>
> > ---
> >  drivers/usb/misc/sisusbvga/sisusb.c | 14 +++++++-------
> >  1 file changed, 7 insertions(+), 7 deletions(-)
> >
> > diff --git a/drivers/usb/misc/sisusbvga/sisusb.c
> b/drivers/usb/misc/sisusbvga/sisusb.c
> > index fc8a5da..4aa717a 100644
> > --- a/drivers/usb/misc/sisusbvga/sisusb.c
> > +++ b/drivers/usb/misc/sisusbvga/sisusb.c
> > @@ -327,7 +327,7 @@ static int sisusb_bulkin_msg(struct sisusb_usb_data
> *sisusb,
> >   */
> >
> >  static int sisusb_send_bulk_msg(struct sisusb_usb_data *sisusb, int ep,
int
> len,
> > -		char *kernbuffer, const char __user *userbuffer, int index,
> > +		u8 *kernbuffer, const u8 __user *userbuffer, int index,
> 
> So the kernbuffer pointer might want to be changed, but in looking at
> the code, there's no difference here, it can be left alone.
> 
> The userbuffer does not need to be changed at all.
> 
> >  static int sisusb_write_mem_bulk(struct sisusb_usb_data *sisusb, u32
addr,
> > -		char *kernbuffer, int length, const char __user *userbuffer,
> > +		u8 *kernbuffer, int length, const u8 __user *userbuffer,
> 
> Same here, these do not need to be changed.

Totally agree.

> 
> >  		int index, ssize_t *bytes_written)
> >  {
> >  	struct sisusb_packet packet;
> > @@ -761,7 +761,7 @@ static int sisusb_write_mem_bulk(struct
> sisusb_usb_data *sisusb, u32 addr,
> >  	u8   swap8, fromkern = kernbuffer ? 1 : 0;
> >  	u16  swap16;
> >  	u32  swap32, flag = (length >> 28) & 1;
> > -	char buf[4];
> > +	u8 buf[4];
> 
> That is what should be changed, and in looking at the code path, I think
> that's it here.
> 
> Sorry for taking you down the wrong path, but I think you should only


It's totally fine, I took this chance to thoroughly read the code 
and learned a lot about how a typical linux driver is written : p


> change things that actually matter, and the above api changes don't
> change anything at all, right?

Yes, this is exactly what I felt when I was compiling the chances.
I really don't see necessity in the changes except the one
that has security implication.

Thanks for the feedback, these back-and-forth deepen my understanding
both of the kernel and how to submit patch.

Sorry for this late reply, I have been catching a deadline for the 
past several days :( I'll submit another patch about the change with
security implication shortly.

Best regards,
Changming

