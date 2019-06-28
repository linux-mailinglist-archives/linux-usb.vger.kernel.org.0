Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 32CCF58FA0
	for <lists+linux-usb@lfdr.de>; Fri, 28 Jun 2019 03:20:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726653AbfF1BUw (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 27 Jun 2019 21:20:52 -0400
Received: from mail-io1-f65.google.com ([209.85.166.65]:39569 "EHLO
        mail-io1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726606AbfF1BUw (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 27 Jun 2019 21:20:52 -0400
Received: by mail-io1-f65.google.com with SMTP id r185so9017576iod.6
        for <linux-usb@vger.kernel.org>; Thu, 27 Jun 2019 18:20:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=9Ey6keDcqLPUKHSw0F8uOIeTCRlUutnNnuzJjxFkK6Y=;
        b=Us9kxWrjFMGdyvWsJf+Nj9kbrKeET+e9dLrNCSJEybmVeNmHsxJeBsWBNq46Z9eCsj
         /UYQatFPrZSsHUH5fz+I+eL7VSclTyYT6gcD9vEpjrWG0VUW53P81oq+hJr0W7OcINzZ
         LRlpVjxjmEOy3Mhh+L68RykLpwgAgqIwNiCnz2pjWce/W3sxME7+NjbLQvkjgJVLjF7G
         3UctQbG4URRPV/fD/NGbtLUi+zDy5PPGVjEH05wlS5/GG34+iJLQjPvutw3+K3UDp+u3
         k7psI5bkqkfUTyy0m9B/easTIW7pHJXFtVE4vSOUOVgC5yTB8nr7UVB/EVHpkPQVnaxm
         98HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=9Ey6keDcqLPUKHSw0F8uOIeTCRlUutnNnuzJjxFkK6Y=;
        b=J4z1tpcVHskkZPXfpCkQcdzi+BlUNyBaUfNIPzjb8WnyD0H0y3UtlBGC3t+sWKPLKs
         u1bhQLa7jjbKpcM+Fv1ZqFu26KNB4Xp5tTpFcEaOLj2zp2wbeoFshG7UaWZsZ7ShJRwA
         4QYxPdepIZMj7qUz4zuGf5rbHnv5IyHfdhgXGkLYwX5pG7Khv06W4JNm6UM57ymqSQ+2
         3b3PtV8IZ0VQgXHWFNgF2guR1UsjpC8uSqaQpFDmJYVmxocEnDqUcNaut7L92iAd8rkp
         dYMJZhAieQqC6eWUqrTL7549F1w1kiOkKJzYHpWU6W4+7MM61eDdLpZ1RdTuiLctYlS1
         qfzQ==
X-Gm-Message-State: APjAAAUh5vIox8eKqoQ4XCpBYmRALFZG6qzYrDof6kZVCLaKblDpkVLD
        Pr4NS7JQdDs7lMQsY7lgps2yupkYK0tC+qRFpj8=
X-Google-Smtp-Source: APXvYqymJQMUS2VUB76wnfbQxOx26yyZmFNo8lNsiFgyXDGcHAmRL7MTtLpavz0zEAsijpBAewk4HvJlUmfGGG0qVVw=
X-Received: by 2002:a5d:9dc7:: with SMTP id 7mr8092587ioo.237.1561684851283;
 Thu, 27 Jun 2019 18:20:51 -0700 (PDT)
MIME-Version: 1.0
References: <AM0PR02MB3841F110F7B6931A087DF566C5E20@AM0PR02MB3841.eurprd02.prod.outlook.com>
 <87o92kk0ih.fsf@linux.intel.com> <AM0PR02MB384108B692229DF41816A363C5E20@AM0PR02MB3841.eurprd02.prod.outlook.com>
 <871rzffszm.fsf@linux.intel.com> <AM0PR02MB38418BFC9965F044B307B13CC5FD0@AM0PR02MB3841.eurprd02.prod.outlook.com>
In-Reply-To: <AM0PR02MB38418BFC9965F044B307B13CC5FD0@AM0PR02MB3841.eurprd02.prod.outlook.com>
From:   Peter Chen <hzpeterchen@gmail.com>
Date:   Fri, 28 Jun 2019 09:20:40 +0800
Message-ID: <CAL411-oZUtL6LETk+oNZXXezeLK4PahPz3_iVZJiM33A3KLaqw@mail.gmail.com>
Subject: Re: No carrier lost information with gadget RNDIS/ECM
To:     Kai Ruhnau <kai.ruhnau@target-sg.com>
Cc:     Felipe Balbi <felipe.balbi@linux.intel.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        Peter Chen <peter.chen@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

> Felipe Balbi writes:
> > Kai Ruhnau <kai.ruhnau@target-sg.com> writes:
> >>> Which peripheral controller is this board using? Is it chipidea? dwc2?
> >>> dwc3? High Speed or Super Speed?
> >>
> >> According to the device tree it's 'fsl,imx6sx-usb' driven by chipidea/ci_hdrc_imx.c
> >> When connecting to Windows, the dmesg shows:
> >>  configfs-gadget gadget: high-speed config #2: c
> >
> > Okay, adding Peter (chipidea maintainer) to the loop here. There are a
> > few changes on UDC side of chipidea between 4.9 and 5.1:
> >
> > Peter, have you seen the problem described before?
>
> Findings today:
>
> The "Lost carrier" message comes when the 4.9 kernel enters runtime suspend (ci_runtime_suspend).
>
> With kernel 4.19, that function is called once during boot with a matching ci_controller_resume when I activate the configfs configuration. After that, the chip does not enter runtime suspend when I pull the USB cable, but does with 4.9.
>
Hi Kai,

Thanks for reporting that.

Do you mean at v4.9, the ci_controller_suspend is called even you plug
in the cable to host? But this does not happen for newer kernel.
Besides, what's your expectation for rndis behaviors for both windows and mac?

Peter
