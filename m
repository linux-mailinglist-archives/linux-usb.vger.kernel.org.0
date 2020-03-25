Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8F3AD192B7B
	for <lists+linux-usb@lfdr.de>; Wed, 25 Mar 2020 15:47:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727689AbgCYOrw (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 25 Mar 2020 10:47:52 -0400
Received: from mail-pg1-f196.google.com ([209.85.215.196]:34463 "EHLO
        mail-pg1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727561AbgCYOrv (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 25 Mar 2020 10:47:51 -0400
Received: by mail-pg1-f196.google.com with SMTP id d37so737175pgl.1;
        Wed, 25 Mar 2020 07:47:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=message-id:date:from:to:cc:subject:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=pxDEsOjM3UFaHt2qYSxBLGrNORMIpdTM3WpsoD2yldw=;
        b=jLak2bOC33v+hfYCh+VUtUrWcFkekBRlEtAgQz5ojYZmEi+vXYVF1pzRYt6W5TeV9F
         4Z0gUue5lj3IJ1fs11h7mjVpRTVjj/blQWEOvarw2CrfEy4U8f2xTW8SEPPQyO+FFDR3
         +svqwP8AGKq8tn5d7ygsNteWp9ZTtzTlvwtp7n5nHTwV1yesZPJa9fecZeIKA/EO99qb
         qZDq1Aocm81icmK7DIdT2pZAEC2DyB6HKrwFjbJejb7GmQErIPdPwoAmePdYnEacxQTX
         cUviISgknRjGILixu+GCHu/oLJFL0X8jeZcW8r73qG1R5zhBAa6Ulg24dstgAmeAnE+s
         LEnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:from:to:cc:subject:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=pxDEsOjM3UFaHt2qYSxBLGrNORMIpdTM3WpsoD2yldw=;
        b=VQ2WWJHGhcVO64N0Z4ozALV132+jfw/MKaWgjxSiumRGnQkBJERhxB+KwYwTfAu8Qn
         /W/E6kJq7nq5h6rHXP4OhiMt/0rQq/WpDQKOepGQQ+lQ/zp92RYuPe7nkkH1tTwDnga3
         fGr6Rao8FEir6+uIJx/CfpmnyIQR1ZVupLHntjAA2t1AW+18jc5uvwULDegurs7SBQuH
         vdNj+694zMd/QEYX5Lceh4Inhq4fyKlciiaZF06wiZRjoumtG9ndrmyjynah4xR6VODE
         r+GGk9w7Y/g74eQfXpqkkjMNYadgrTT3NxDZQ6GSkGOh8gVU87oaj7QJRzeT96OoqSeJ
         sl8A==
X-Gm-Message-State: ANhLgQ3UmKfB//ARp5kn0D7w8ABJck2igA1b/zQzciMwepX7LC+nlLzh
        NpfI1b0EzX5aZUl+JwGMUhkXMM61
X-Google-Smtp-Source: ADFU+vsM/RwJvZT55lZjeaB5ynZp8KAnLFfAujWqvqagpNi0KVxTLPZLDHkbV110nutncLMiuWihgg==
X-Received: by 2002:a63:4d46:: with SMTP id n6mr3458601pgl.275.1585147670024;
        Wed, 25 Mar 2020 07:47:50 -0700 (PDT)
Received: from SARKAR ([106.51.108.92])
        by smtp.gmail.com with ESMTPSA id m29sm8008082pgl.35.2020.03.25.07.47.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Mar 2020 07:47:49 -0700 (PDT)
Message-ID: <5e7b6f15.1c69fb81.d92d3.facb@mx.google.com>
X-Google-Original-Message-ID: <20200325144745.GC7983@rohitsarkar5398@gmail.com>
Date:   Wed, 25 Mar 2020 20:17:45 +0530
From:   Rohit Sarkar <rohitsarkar5398@gmail.com>
To:     Oliver Neukum <oneukum@suse.com>
Cc:     linux-usb@vger.kernel.org, linux-newbie@vger.kernel.org
Subject: Re: Beginner query regarding usbhid
References: <5e7b5fbc.1c69fb81.cace7.7aa1@mx.google.com>
 <1585147543.3831.8.camel@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1585147543.3831.8.camel@suse.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, Mar 25, 2020 at 03:45:43PM +0100, Oliver Neukum wrote:
> Am Mittwoch, den 25.03.2020, 19:12 +0530 schrieb Rohit Sarkar:
> > 
> 
> Hi,
> 
> I am afraid something went wrong with your mail.
> 
> 	Regards
> 		Oliver
> 
Ah, Thanks for telling me. 

This was the original mail:

Hi,

I was trying to mess around with the driver that drives my mouse. I
found out that it is usbhid. I then added a printk statement to the init
and exit function of usbhid.
I then compiled and installed the usbhid drivers. Post that I ran
`sudo modprobe -r usbhid` and `sudo modprobe usbhid` but couldnt observe
any logs in dmesg.

I am certain I am missing something fundamental. Could someone help me
with this.

Thanks,
Rohit
