Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D4DC4B9986
	for <lists+linux-usb@lfdr.de>; Sat, 21 Sep 2019 00:10:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730658AbfITWKc (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 20 Sep 2019 18:10:32 -0400
Received: from mail-io1-f44.google.com ([209.85.166.44]:41604 "EHLO
        mail-io1-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726343AbfITWKc (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 20 Sep 2019 18:10:32 -0400
Received: by mail-io1-f44.google.com with SMTP id r26so19556932ioh.8
        for <linux-usb@vger.kernel.org>; Fri, 20 Sep 2019 15:10:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc;
        bh=jrhyY00ePWTHaGU1wYKLzIVLP4/w4KHOdW4Nf0tMnac=;
        b=QM+RXfCtnjQLDY+9MXvoo4IwPX6z0DBO5zyZX3y6QBETCLEhGBg7kepsvhGMnGtIex
         jGeB75Ft03tdqg6YVNMH7WkhVyeZYsY8Pph/M1xkP9C6qeRH7lDs24Sj2mdIqCdW4zMQ
         9eK8sips8VjxSScPBIYXIBLh5fyMZHerNYC9m0KN79R81f99slRLFULWwXhXXBcDzRyn
         ROHiGPYvtae+5VgLUwc0C3L8bZL5+uB3LBRFP+VO1dHd8PuuCA/0wc+csLjrXPszzKmX
         cv2iFT2O36mub/auH0+tdfLomt707PfqmKIIzj0QhATXzsbFRoR74cjFpUY5mU6JspD0
         R7/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from:date
         :message-id:subject:to:cc;
        bh=jrhyY00ePWTHaGU1wYKLzIVLP4/w4KHOdW4Nf0tMnac=;
        b=OKXlND8KbFXX3VOeJCXIsxkUq1TAXrXLYZgbYUzJg6/7L40mttm5lgNRg0iFxmBjEF
         WYTNrHTaIsw70Ayy9woXsVx+49ZozTq3ZYj/d+ctTNfzMV3u/wXtsDkbN+ccg1EjjCJC
         8mFvTezsWd3/2SkECsxmZdGVsroDtEYXRqmL65/lOKOpFGkHA9yQnQQ4pcPlS/fenUDW
         GK8GFxyDMPao7x89ETE7F8GEGTKvIkEliUzgCLtdE/gZdhWOmg1B+0vOmWMiryik3AP+
         hGhzC+aGM2pNuXnxk72CD6mKSyn7GGqj+LbIznfa9PkYLPqpud6F20KGajn5hDTf9ENc
         g/YA==
X-Gm-Message-State: APjAAAX1LATc0ToNHoC8s7zrcot9DNeRA0YLdUVvOihHK92CJwHR+pxe
        Yhjlx7CTpI3Gtqo53TZdli/YJXK/3Vtp3DCrgEGw5CNH
X-Google-Smtp-Source: APXvYqyDDiWBMlDS/MvKO0cvmT1v3eIpMbtNst5hSeQ7EMY8uUXDOhuQYzu5ehGqdz2AcFbsfAJmFufsxoWdRxct+K0=
X-Received: by 2002:a6b:bd42:: with SMTP id n63mr11016042iof.53.1569017431242;
 Fri, 20 Sep 2019 15:10:31 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:ac0:9c85:0:0:0:0:0 with HTTP; Fri, 20 Sep 2019 15:10:30
 -0700 (PDT)
In-Reply-To: <20190918054744.GA1830105@kroah.com>
References: <CAA=hcWRF00syz8jB1+qdy1pFA7Wk_B=1Z_DT5vYuQrzFKhtZbw@mail.gmail.com>
 <20190917120258.GB489142@kroah.com> <CAA=hcWTD2zYD0gVTu6sDuRqUcTOnn42Gm0s1tOGvBQdQ40Q7LA@mail.gmail.com>
 <20190918054744.GA1830105@kroah.com>
From:   JH <jupiter.hce@gmail.com>
Date:   Sat, 21 Sep 2019 08:10:30 +1000
Message-ID: <CAA=hcWR__j20ZQY9H8zzTryEatSfe+yXLYQXSaXMvgy3pwdJKg@mail.gmail.com>
Subject: Re: Failed to connect to 4G modem
To:     Greg KH <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Greg,

On 9/18/19, Greg KH <gregkh@linuxfoundation.org> wrote:
> Otherwise, just use 5.3 now and then 5.4 when it comes out in a few
> months.

My apology for an off topic question. I discussed with my colleague to
use 5.3, if we cannot wait for 5.4 LTS release, we will do a remote
5.4 upgrade from 5.3 on air for the product. One of my colleague
warning me that kernel 5.3 and 5.4 LTS will not be a minor upgrade, it
will be major upgrade which will have massive libraries changes. I
don't agree with it, but I could not find kernel document to state
either 5.3 and 5.4 LTS is a major or minor change. What is your
insight view? Appreciate if you could point me a reference to prove my
colleague is wrong.

Thank you very much, apologize again.

Kind regards,

- jupiter

> good luck!
>
> greg k-h
>
