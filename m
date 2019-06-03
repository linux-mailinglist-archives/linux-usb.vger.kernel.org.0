Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EAB1632E55
	for <lists+linux-usb@lfdr.de>; Mon,  3 Jun 2019 13:13:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727838AbfFCLNw (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 3 Jun 2019 07:13:52 -0400
Received: from mail-wm1-f65.google.com ([209.85.128.65]:50556 "EHLO
        mail-wm1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726924AbfFCLNw (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 3 Jun 2019 07:13:52 -0400
Received: by mail-wm1-f65.google.com with SMTP id f204so6724316wme.0
        for <linux-usb@vger.kernel.org>; Mon, 03 Jun 2019 04:13:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=unipv-it.20150623.gappssmtp.com; s=20150623;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=zaO6LHxQeKxaWj6XX6zB7bwsYeAhZVsHkqWR+rvrcwQ=;
        b=h6n3hhNCI0f0joJ8CEXoOAmIMOyQ54s52DV7eqaivC7wXWMM1TMZGCtuPMBTeZedLU
         B+3/KVRG9TsUo7FVUukw/9pK1vG9tVTyhjMJALrhvqY7G7VeiPOCYS6NAslu4GNQ/H8C
         /GvnH9bQzSiQ1uebq7YguNryXPM3KbVyLQ+xcctdxAxJLa64MbEiyI4ub6dF5unS0uIb
         GS5pCnQ0V3VyPu4Fd/2aqMoNnk5E02ypUMm5O22Jlrf2BKzy5yzYSPRdeSIg99CWRbZa
         9r0QOLX1O5i0SpsiWa2b0nGUW+BAhaziWNc56oEkxFlmhzLsSr15q/4wqOTCCx5yhR+j
         TA/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=zaO6LHxQeKxaWj6XX6zB7bwsYeAhZVsHkqWR+rvrcwQ=;
        b=N9z42zrk8/paD0UgM5iE4LltLvNImeR99zbuE6jbLoCikhpxXQXJTJWMTUje26u/7V
         0xh/J/uIlEzHN24XbBtY3zDkOZ7Ohuc2j1mOIsnFkynpRilroVMWpB/gCrOroDUjhWpp
         chxpX/noKk9mtt0xUubDe2JfI1smQ1aKQkuUokKOdjqv8v9CVic5iWoaMVKTErUjkJj0
         1RwOA8BpCNV0mp3/jHa7Vw4XDenfPYjGdB7V38nRIz4bz/8wT8Vv+tZ51rZtIDBC2X0t
         CaX8rbQcRzJAYhzFJ3e8kSn+4Vd5my5LtI97EpSLf2akpj8E0yeciKwRMzDF31P7/up3
         TbOg==
X-Gm-Message-State: APjAAAVfhIREeH8ifEbUd31jZa+m72EYB0U1FqzDe3MuJnzPZ7Qkejdc
        a5cTdHFvyQHbGkSdgCTYwrI+TA==
X-Google-Smtp-Source: APXvYqz2d2XK1sgw73ELv/Ch/mtQ1YL4IJPDCnpvfIiOlPyPag8HH40MGumrS+FqHJyooYQtAbszJA==
X-Received: by 2002:a1c:e90c:: with SMTP id q12mr14049119wmc.128.1559560430025;
        Mon, 03 Jun 2019 04:13:50 -0700 (PDT)
Received: from angus.unipv.it (angus.unipv.it. [193.206.67.163])
        by smtp.gmail.com with ESMTPSA id n10sm7142869wro.96.2019.06.03.04.13.49
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Mon, 03 Jun 2019 04:13:49 -0700 (PDT)
Message-ID: <86676f40a8c1aa44bf5799eac6019183d6d33336.camel@unipv.it>
Subject: Re: Slow I/O on USB media
From:   Andrea Vai <andrea.vai@unipv.it>
To:     Greg KH <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org
Date:   Mon, 03 Jun 2019 13:13:48 +0200
In-Reply-To: <20190530132522.GA21005@kroah.com>
References: <2a9e1be71a2c6c940dac904752fdd34129745444.camel@unipv.it>
         <20190530132522.GA21005@kroah.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.30.5 (3.30.5-1.fc29) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Il giorno gio, 30/05/2019 alle 06.25 -0700, Greg KH ha scritto:
> [...]
Hi,

> Any chance you can use 'git bisect' to find the offending commit?
Yes, I am doing it as I managed to build the kernel from source

> 
> And did you accidentally turn on "sync" for the filesystem? 
Sorry, I don't think so but actually I don't know exactly what it is
nor how to check it...

>  How do you
> know the old kernel really flushed the buffers out in 1 minute? 

I used to try to unmount the usb media (e.g. "eject" using Nautilus
file manager), and got a message stating the filesystem was in use and
could not be mounted, so always answered to not eject it until it was
unmounted without any warning... does it make sense?

>  But 12
> minutes is really long, did anything else change in your userspace
> between the kernel changes as well?
I am not sure if I understand correctly the "userspace" you mention:
if you mean my home directory and contents, settings etc, then yes,
maybe... but while I am doing the tests I am quite sure I didn't
change anything, and double-checked many times that the 4.20 kernel is
always working (I usually boot up with it when I need to do the usual
day work).

Thank you for any further explanation,

Bye
Andrea

