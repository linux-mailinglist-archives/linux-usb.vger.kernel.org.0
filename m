Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8DDB1ECDCC
	for <lists+linux-usb@lfdr.de>; Sat,  2 Nov 2019 09:58:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726593AbfKBI6h (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 2 Nov 2019 04:58:37 -0400
Received: from mail-wr1-f68.google.com ([209.85.221.68]:39236 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726529AbfKBI6h (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 2 Nov 2019 04:58:37 -0400
Received: by mail-wr1-f68.google.com with SMTP id a11so11894644wra.6
        for <linux-usb@vger.kernel.org>; Sat, 02 Nov 2019 01:58:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=7h7tBVx0HygGOAQxlpEHTQGdRzjwZpYopMv2VEID6ek=;
        b=IVhXj9GxzVKnvgoeqQptptrdCf7vdi9UnrrJ6l5miq6y7/JWhA7fWOI8//0SauAIgE
         CaVOh0yXYc5ty3jrO+IvckGhWmlsOhudrNliDQQFMEQEDnFe+9ZVotoRgq4Efn7fZrDg
         EY+8xHw8LksbqumR36+1MYQ6Q8cOyqOWBlj3ZwvcSIu9vmDFIbfsAtG02nzNiDhJZZCH
         eURG5TXUI0NS/USSPA1l9FQnHXpLoerwwiPlsyJ0hJhyx2sJUY0UobovWxymI1Aqjcrw
         /mWH8+6Vfqf0HFciivXC2B3l058FZosw+AtTrsH0nFz65f2pbunAbw6bvORIgjUz49sh
         NzHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=7h7tBVx0HygGOAQxlpEHTQGdRzjwZpYopMv2VEID6ek=;
        b=TD+FGVCQoUnVXxklLA/NZedw1QljL/bAzjxZd1TsQSdJURU8JPtOBHMesFjLqMXy8J
         V0XFwNd8uwt3Boj1JMv+8SFAbQsvO7FlmgpTcXtbIM4OEXv8wNfU+1uv8oKGzobBcrtk
         GAWIUiNDFw2kvwP6MVuGulgcv2dV4cEhdGuIEUrSDGlRP8mBHzH7TzJ61ANOMzII1fqC
         oJOi28oZ/yjYZYEp0OtZDD9J+FOvfocqkRnfY7ROQlmn6JZBSFvagkQ3hVXfRbBANusN
         jWo68Z/Sz4S7EOogC6fhPYpJrbQSq58fkAqE3oYwDMvhL8WNKeKc0X/26urUorjzApwt
         4cyA==
X-Gm-Message-State: APjAAAXv9eTGnJpoJOwX5hpXJxoSmVVl3ig2zQw6q2zY9IciGz6kMVUN
        e8PJdLJLRx0jk4NLXvdV4DeX79IvEqy1vrhvHyA=
X-Google-Smtp-Source: APXvYqxfyMhjf8uwOavYyx8QcLjBgQTVp/cMKjAADXK1ddyjtwpYv4jF+SLq25UT25uUk88n/bYArDl4c0SixVvp/mU=
X-Received: by 2002:adf:c58f:: with SMTP id m15mr14149910wrg.362.1572685115729;
 Sat, 02 Nov 2019 01:58:35 -0700 (PDT)
MIME-Version: 1.0
References: <20190924121400.1497-1-charlesyeh522@gmail.com> <20191023085657.GP24768@localhost>
In-Reply-To: <20191023085657.GP24768@localhost>
From:   Charles Yeh <charlesyeh522@gmail.com>
Date:   Sat, 2 Nov 2019 16:58:24 +0800
Message-ID: <CAAZvQQ7EdZ=5TtU0qHBzACQ=g5equR+F-j2nt+-0F3bYOH4F7A@mail.gmail.com>
Subject: Re: [PATCH] [PATCH v8] USB: serial: pl2303: Add new PID to support
 PL2303HXN (TYPE_HXN)
To:     Johan Hovold <johan@kernel.org>
Cc:     Greg KH <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org,
        =?UTF-8?B?WWVoLkNoYXJsZXMgW+iRieamrumRq10=?= 
        <charles-yeh@prolific.com.tw>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

>
> Now applied, thanks.
>

Hello sir, when to start updating the patch?

Charles.
