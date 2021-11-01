Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CC0B84412D0
	for <lists+linux-usb@lfdr.de>; Mon,  1 Nov 2021 05:53:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229669AbhKAEzt (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 1 Nov 2021 00:55:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39682 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229462AbhKAEzt (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 1 Nov 2021 00:55:49 -0400
Received: from mail-yb1-xb2b.google.com (mail-yb1-xb2b.google.com [IPv6:2607:f8b0:4864:20::b2b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 45516C061714
        for <linux-usb@vger.kernel.org>; Sun, 31 Oct 2021 21:53:16 -0700 (PDT)
Received: by mail-yb1-xb2b.google.com with SMTP id 131so30115407ybc.7
        for <linux-usb@vger.kernel.org>; Sun, 31 Oct 2021 21:53:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=X7FEhn6Tl2UoNynMJLa0n6Y/fRORJdkZfPa3LHqz8j0=;
        b=lWRQ/RO3bn6HGGI1a7ev76ph9uy9wqZ1J+rlsZgkgstF//TUJ0p/t9Xqx5SmccZ61v
         ykIfVReVLWUrtIxOVB9VzXLkrE0UPz/JCukpsO1/ESWdm2c8MzeK+BChg0e4oALgya8g
         H5p5FeFBTf5n7LZHP5hHhXKNau1PfTzLh7CwbrN3KqwFSMi74xgIuLNI4Rm5IOzNt19a
         XDARDkuIrbJbjOQcEG3igCNgEAPkoNbjAHeOPw5wdB1dOA08lviVp9GJMKGcRmRYsYf9
         QQp85N+jCJwrTIJ7orxFqgJLKUZ9LNGqGi5Y9RTr46Lxg5fqtb0MA/K/kTxSSDKfE1kG
         TEqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=X7FEhn6Tl2UoNynMJLa0n6Y/fRORJdkZfPa3LHqz8j0=;
        b=foQhDz4MlY/2xNmmKcaUtyVD8M5YgUBp2MrnPPT2oOGpgi2lY8qkyv3XvGCFTMQ5re
         8rWtzK53nMqihX+oAIVhiESixknE1lqcaBV3/kKBh96GrWjMr3JPMLaZnQbGq/r+f53V
         mxMaY48Ytfh/6wbAoAavlt5hYB5QNAEs3GJGnJxMZGyhbxMYFs1SC8IEDb7Kh47BLgwX
         Hf97hTPdE+gTfXJD5mL66RWMClFahnpnV0Zk/8m0UZVeTUkEWMNTTA/ec9j3HunDVSJT
         nsjGIohqekiIHYkbR3T2131uMoK6pbckF+J0b7GE20EqLFzm98QJq4fsR5/9dZqkNf2O
         +Zng==
X-Gm-Message-State: AOAM530dA+Qr3R1Fwa0JmPXGjHxlGbWhaPxetf/klPCDldAVKQp523PP
        4X2prJMPt1fdidAtYln6FYDYvDL1vMulv5Bh3w9wU9p61B8=
X-Google-Smtp-Source: ABdhPJyBKXSPsn33RE/DqlQsylTyLZfXyvKAw+1g8kqtrAD7kXhRF89xy14V4umRJRsNCjMj79JoQCu4ZDVzODqlPzE=
X-Received: by 2002:a25:4f89:: with SMTP id d131mr27722210ybb.397.1635742395049;
 Sun, 31 Oct 2021 21:53:15 -0700 (PDT)
MIME-Version: 1.0
References: <20210622120906.743-1-charlesyeh522@gmail.com> <YQpx5Y6CZUP+u7LS@hovoldconsulting.com>
In-Reply-To: <YQpx5Y6CZUP+u7LS@hovoldconsulting.com>
From:   Charles Yeh <charlesyeh522@gmail.com>
Date:   Mon, 1 Nov 2021 12:53:03 +0800
Message-ID: <CAAZvQQ6q4Kg2iHkD4JefJ3r=pa9Gbz_y_5utgwSGQL_2HH7Ohg@mail.gmail.com>
Subject: Re: [PATCH] USB: serial: pl2303: Add new PID to support PL256X (TYPE_MP)
To:     Johan Hovold <johan@kernel.org>
Cc:     Greg KH <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org,
        =?UTF-8?B?WWVoLkNoYXJsZXMgW+iRieamrumRq10=?= 
        <charles-yeh@prolific.com.tw>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

This issue can be closed.

Sorry, it took so long to reply...
Finally, our company(Prolific) decided to change the new chip from
"Class FFh (Vendor Specific)" to "Class 02h (Communications and CDC Control)"
In this way, the chip's default support can be backward compatible
with the lower version of the Linux kernel (such as 3.X / 4.X,...)

If there are customers who need RTS/CTS and other flow control in the future.
We(Prolific) will provide patch file to support

Finally, thank you for your kind review patch code.

Charles.
