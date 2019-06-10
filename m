Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C9C8A3B7D7
	for <lists+linux-usb@lfdr.de>; Mon, 10 Jun 2019 16:55:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390127AbfFJOzi (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 10 Jun 2019 10:55:38 -0400
Received: from mail-wm1-f68.google.com ([209.85.128.68]:36562 "EHLO
        mail-wm1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2390087AbfFJOzi (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 10 Jun 2019 10:55:38 -0400
Received: by mail-wm1-f68.google.com with SMTP id u8so8488804wmm.1
        for <linux-usb@vger.kernel.org>; Mon, 10 Jun 2019 07:55:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=unipv-it.20150623.gappssmtp.com; s=20150623;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=grpyJzpY2dq78MaqCsFjp6aOPdiyZO5ANWkqeCMDb2E=;
        b=w/eKKSWhOoEaBZJpd25LXFkhehQsayD+ZCo+gIFsoHK9sclz0/Fx8NGoYdPBLeY/6Z
         uPlMw02d0iKOdBn9OwdoQyO/knNzSw2owvJBehFAn3ikRt6fn4ua/0oK55bwzgry0rkr
         Hz1lPt9t4ZmVojTnwlAMX8RVQJ4jaV67ijOn8MzVL8PLhQD04uNPP7fNuSKz/4iq9qQ6
         uSmJS1a2j8PA2hHtqeHRDBKJgeDwIADph4qyUxpeun2HMFHa1l+V4bh2SY6Erlslm1K+
         b8w/Bw6NucDN/qYOLet0mG4qwUSx1gkrcGmJA4iOtTMVR2YxLWvhRPu9HLmEhanoarHz
         JXKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=grpyJzpY2dq78MaqCsFjp6aOPdiyZO5ANWkqeCMDb2E=;
        b=fsApiui0FRfK+88gCjOwFBNmf9t5M2QAibba7n5Xn2jljHRkQfZxYw4YLzOg+8l6Mo
         siK9AeVKBO1Pi13AF2/2VAI9iryZ/MFy1+lRXO/yO9Fo8YBqVhVLPypx3U8Obf9w4M+V
         tZRkb/XSAmeIYEiKhJFcUVsKhslOLh+uumdQsBQjyjPyS0AGQ0WlUI6uABG6mZDLoylg
         klK7gAA0tQ+MsY200HTpiJGAFCZIjWsEx2d6LRBgPIJeu6O2vCvnwAvtqhfjACvhAlM2
         zJYZNwYWGIjtWDPo6pllegj0PFc23NZb51vZ6qbPzCRXSUECDY72l676ImZARaC1MN0p
         XSqg==
X-Gm-Message-State: APjAAAXeLe55sos+hjipifoUAIH8CbLba8PlnYlESULcuONiWI3PWdIf
        r4yH8Lz75am852v3qJk2Uugt+tG5x7I=
X-Google-Smtp-Source: APXvYqxKoHJ9dC9gfhq/TLzwNkedUoxO2v/gl0WGaMPMs9Iqc7sPF30w1urh0B68nix82FGJSF9ONw==
X-Received: by 2002:a7b:c144:: with SMTP id z4mr14566041wmi.50.1560178536381;
        Mon, 10 Jun 2019 07:55:36 -0700 (PDT)
Received: from angus.unipv.it (angus.unipv.it. [193.206.67.163])
        by smtp.gmail.com with ESMTPSA id a67sm5347931wmh.40.2019.06.10.07.55.35
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Mon, 10 Jun 2019 07:55:35 -0700 (PDT)
Message-ID: <fd2b71b53a5ca4b6ab635dc6d04676d157c2c46c.camel@unipv.it>
Subject: Re: Slow I/O on USB media
From:   Andrea Vai <andrea.vai@unipv.it>
To:     Alan Stern <stern@rowland.harvard.edu>
Cc:     Greg KH <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org
Date:   Mon, 10 Jun 2019 16:55:34 +0200
In-Reply-To: <Pine.LNX.4.44L0.1906101030280.1560-100000@iolanthe.rowland.org>
References: <Pine.LNX.4.44L0.1906101030280.1560-100000@iolanthe.rowland.org>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.30.5 (3.30.5-1.fc29) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Il giorno lun, 10/06/2019 alle 10.40 -0400, Alan Stern ha scritto:
> 
> 
> [...]

Thank you Alan and Greg for your patience and answer. I will carefully
consider all the advice you gave me, but one in particular stands out
to me first:

>         Not setting up the .config file properly for each build.

How should I set up the .config file properly for each build? What I
did so far was

cp -v /boot/config-$(uname -r) .config

(when I was using a "working kernel", maybe the Fedora one) before the
first build, then never touched the .config dir again during the
bisection.

(Also, I use to press ENTER to accept all default choices when
compiling, is that correct?)

Many thanks,
Andrea Vai



