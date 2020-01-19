Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 42044141E24
	for <lists+linux-usb@lfdr.de>; Sun, 19 Jan 2020 14:19:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726874AbgASNTu (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 19 Jan 2020 08:19:50 -0500
Received: from mail-wm1-f66.google.com ([209.85.128.66]:34031 "EHLO
        mail-wm1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726778AbgASNTu (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 19 Jan 2020 08:19:50 -0500
Received: by mail-wm1-f66.google.com with SMTP id w5so12827238wmi.1
        for <linux-usb@vger.kernel.org>; Sun, 19 Jan 2020 05:19:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:references:in-reply-to:subject:date:message-id
         :mime-version:content-transfer-encoding:thread-index
         :content-language;
        bh=aN5la1RwlPqyXGkrWZy4Sf7hSMIhr02vQL3IqZP0R6g=;
        b=IankWgt959DtUKd96zqmL/ItvVbvlmVhHyd5rj+xNWHGxNfPFdRhmARp9TZAsvhzrU
         pz8iQSMkNDugxDTSwEbqD5DcvJq+LHY34j3UVq+MB+ioXfib647hmfd/PpAjY7+iAbkt
         PNUHVei2lKNqpt94D2aHcj54kQO1K9KFSf9envNTaEXA8O216KVftRRT1u1iZx+dsf3X
         /Qi+PJBWDRI9WUTOQ1VqPprAaG6PgvxoT5Y8ro+1rxyu7vmQfTz3BY5t0RbVWJgWTeM1
         64aTq+hX4svyAD/H3hqMQ7Wl+ZK/mP5bbaow/5PYM/qIk4g3q2HXGI/K/bhKfqGwARbJ
         1eGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:references:in-reply-to:subject:date
         :message-id:mime-version:content-transfer-encoding:thread-index
         :content-language;
        bh=aN5la1RwlPqyXGkrWZy4Sf7hSMIhr02vQL3IqZP0R6g=;
        b=R8Mcs6N5mI/Tw4Ot8zI0gFsYIki3+jt+pf0bNZO5Fs96u80lnc2xeTIjaDTUDdno0x
         eAA+CJX7vPBXndr7DcGk0Z9WfWFjY5kYXflQLEvA933JcyxzLwjAmIlOcbFFEnrZ9XB8
         yFkFX/WTG+BVFPyxs9M8cGBsiNfVvWcMhrjhdr8JYstrJPBzneIetemGKtVOAu+44PgZ
         dGnWin774+eFfeOdIajTNUZ18eLWJXYJ7L07/j1bdVHxcknNq0luDy+aKcHFEhNfG6v1
         8joc0R5haydCSVmidQVfhb8HfNREyC22J0Qb64mUIJH1k4M+uPF+gHWmLjLMkcskN5Re
         /q4Q==
X-Gm-Message-State: APjAAAVK45BHyKGNpmkknnSTQchFlKQVOME8QxkZYR+IIHRgjY/NpmbP
        ck/wVmC9dpnJNaawe5/Ihr8=
X-Google-Smtp-Source: APXvYqxKrNWpH3jyrOJg+IeKxmsZZRuK2D3VBaJZDCyYQm5l3dLmOwsLmYr5fHwiMOthvjd6wK5z4Q==
X-Received: by 2002:a05:600c:2509:: with SMTP id d9mr14109098wma.148.1579439987777;
        Sun, 19 Jan 2020 05:19:47 -0800 (PST)
Received: from AnsuelXPS (93-39-149-95.ip76.fastwebnet.it. [93.39.149.95])
        by smtp.gmail.com with ESMTPSA id t1sm18492327wma.43.2020.01.19.05.19.46
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 19 Jan 2020 05:19:47 -0800 (PST)
From:   <ansuelsmth@gmail.com>
To:     "'Greg KH'" <gregkh@linuxfoundation.org>
Cc:     <mathias.nyman@intel.com>, <linux-usb@vger.kernel.org>
References: <20200118235828.14131-1-ansuelsmth@gmail.com> <20200119125315.GA149506@kroah.com>
In-Reply-To: <20200119125315.GA149506@kroah.com>
Subject: [PATCH] usb: host: fix implicit declaration error
Date:   Sun, 19 Jan 2020 14:19:45 +0100
Message-ID: <000f01d5cecb$1ead1440$5c073cc0$@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain;
        charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQIqGlYU/giIFpy4t1o1jqICEaMUcgIj3UeApzhCdBA=
Content-Language: it
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

> On Sun, Jan 19, 2020 at 12:58:28AM +0100, Ansuel Smith wrote:
> > If USB_PCI is not enabled, this error is triggered.
> > drivers/usb/host/ehci-pci.c:152:7:
> > error: implicit declaration of function 'usb_amd_quirk_pll_check';
> >   152 |   if (usb_amd_quirk_pll_check())
> >       |       ^~~~~~~~~~~~~~~~~~~~~~~
> >       |       usb_amd_quirk_pll_enable
> >
> > Signed-off-by: Ansuel Smith <ansuelsmth@gmail.com>
> 
> Is this a new issue?  What commit caused this problem?
> 
> thanks,
> 
> greg k-h

Looks like this is caused by 4fbb8aa75836c3361987f431d9451aecc1830bdd
and ad93562bdeecdded7d02eaaaf1aa5705ab57b1b7.
Looks like it was never added to the header file else condition.

