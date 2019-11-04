Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1310BEDCA1
	for <lists+linux-usb@lfdr.de>; Mon,  4 Nov 2019 11:33:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728355AbfKDKd4 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 4 Nov 2019 05:33:56 -0500
Received: from mail-wm1-f66.google.com ([209.85.128.66]:53796 "EHLO
        mail-wm1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727998AbfKDKdz (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 4 Nov 2019 05:33:55 -0500
Received: by mail-wm1-f66.google.com with SMTP id x4so4871265wmi.3
        for <linux-usb@vger.kernel.org>; Mon, 04 Nov 2019 02:33:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=4rwkxadMSlvLNukb63cJrlwfYk6AB4r/i5+Db8K2Kos=;
        b=uwCAkLrlM5zpyFc2vP9xO8+zeE9i0UlNEJrgGuZ8i3Cn9YiGE0m+C17wpwAxilcL6h
         EoXimXqQiZt11YY8SWLOZxRQNx37B0VKDdgoFW+9Y3+meCinrZ9CgPR17xcnzwtR3pZy
         b/ojgGesEaPP+lhVeoRaGeiw6q1pIVtqwPS0u+ZTxhBdSju7EvVLzTbogT5NmwqHZrfW
         QPmbNqZFLDffsLU3pbrGpZAue+3m4tIl0EkTHafgY6mv4jeenoEeMLVUa58Wyg2uXx6S
         X464rx40TZRcbWW5o+AsM8dXn65K9PWosu/wWDoe1HK7bpWwfMKqkjrgu4TfDXHa4Xtv
         7D2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=4rwkxadMSlvLNukb63cJrlwfYk6AB4r/i5+Db8K2Kos=;
        b=VPlS1XBpiFhbAgOCCs3Yo4YPttpXgktnVL0qzq5HL9CyjJN/7C067wSDCPrJjLLvtY
         SjCnKmC08WkcJ5HIOJYUivFRVnGVkWQ3AdBE+xjJq2U7MY4ZceNuZ2K89wmZBV8JQ8A2
         9A7Ofix6AScZoTmDxs4NzquQxfFHCHDpGLTfun9APh7RhWxP8ef+lcDcKzRukScxkJUu
         DYQmzfOo7j6h/MLlsfYHykDAYPuInsCbFWRQHUZUMeC+NrWZwiOo7sXoaVfZnv4qdeC2
         /XPycc406p37PF83vNrJ0QRlSD3am5HXMFfVf1GzfHptm9mgYX5xipjRADTRs89m4IGI
         f28A==
X-Gm-Message-State: APjAAAWBiq5NSMMtc3M9HQBAw/+Axp0kazIrvOmERYBVFMmjqwzyiYxh
        8Rats7FkA0gvTPrrCoH7TuRuVGrg5lne8DlAWIrgpACE
X-Google-Smtp-Source: APXvYqznxFp0I5d8wcsSILnPn11gUolctl0QPjv1i88uwttLB/7+yXGIDiXSYYwiKqfePYQfcFyzwk0rZvTfVn6MaTY=
X-Received: by 2002:a1c:6702:: with SMTP id b2mr21211439wmc.107.1572863633813;
 Mon, 04 Nov 2019 02:33:53 -0800 (PST)
MIME-Version: 1.0
References: <20190924121400.1497-1-charlesyeh522@gmail.com>
 <20191023085657.GP24768@localhost> <CAAZvQQ7EdZ=5TtU0qHBzACQ=g5equR+F-j2nt+-0F3bYOH4F7A@mail.gmail.com>
 <20191104091521.GF3657@localhost> <CAAZvQQ5jTcEz8C4QDkRGdS+WiDv7YMMiX4kyLfjUTxxpUSPxwg@mail.gmail.com>
 <20191104102713.GG3657@localhost>
In-Reply-To: <20191104102713.GG3657@localhost>
From:   Charles Yeh <charlesyeh522@gmail.com>
Date:   Mon, 4 Nov 2019 18:33:42 +0800
Message-ID: <CAAZvQQ7RNGVikVyTUu0AaFRqs67fLpj9O1qbaAnuWBmtNMwq0A@mail.gmail.com>
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

OK..
Very thanks for help and explanation..

Charles.
