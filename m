Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D3BD9BB4F8
	for <lists+linux-usb@lfdr.de>; Mon, 23 Sep 2019 15:08:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2404887AbfIWNIF (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 23 Sep 2019 09:08:05 -0400
Received: from mail-lj1-f196.google.com ([209.85.208.196]:43153 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2394032AbfIWNIE (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 23 Sep 2019 09:08:04 -0400
Received: by mail-lj1-f196.google.com with SMTP id n14so8583484ljj.10
        for <linux-usb@vger.kernel.org>; Mon, 23 Sep 2019 06:08:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=GoIAIXzFV824pjQ30902obp3iYyQkh8cxwDip0pl4DY=;
        b=bdhWboZrxyGH/n1yqX7qr4uYXW7dGqJjayFl7OHmW7jBVXv5XakXwjorPW+YI296UQ
         GLUjhZlTujIinOzYY5ZMGBR2dmfDTnRGCa4QfE+lINfnF+X+FqztQkPM+qxlWqj44BFP
         ir2ydM1x4DXr7sNZOuvHFfup7uhImbuS5AiUMoRQqdeAf8SLFtrSP7vHRunRr5nPATiO
         ci+H4l+qsgs8Vjxgg2vAWfWUjYAu9SR7czBs2JgzE4qW5n87/5g6UTzmeZpBpgr+Dw8D
         iy/os0mJxBblKpkf3iueJpn0wpkT3TmqEiESJj1JNuzRwoXeYpsaEyDuMuooBaNcrC40
         falA==
X-Gm-Message-State: APjAAAX90RI08mPGhW/06aGnkV21OUq5fyJRoC1dFBBNldgYla2/x/4k
        yDVX9BfY512gVSgd8LQNXtU=
X-Google-Smtp-Source: APXvYqwCux2PTE2Q3HvgtoXcAdWfnbFVQYm7xrCJTPWuIZpWrRunxVra1XDWyql1kl46TfQ/Kk8mTg==
X-Received: by 2002:a2e:7c17:: with SMTP id x23mr16759043ljc.210.1569244082720;
        Mon, 23 Sep 2019 06:08:02 -0700 (PDT)
Received: from xi.terra (c-51f1e055.07-184-6d6c6d4.bbcust.telenor.se. [85.224.241.81])
        by smtp.gmail.com with ESMTPSA id z26sm2287762lji.79.2019.09.23.06.08.00
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 23 Sep 2019 06:08:01 -0700 (PDT)
Received: from johan by xi.terra with local (Exim 4.92.2)
        (envelope-from <johan@kernel.org>)
        id 1iCO4S-0001Gp-DT; Mon, 23 Sep 2019 15:08:04 +0200
Date:   Mon, 23 Sep 2019 15:08:04 +0200
From:   Johan Hovold <johan@kernel.org>
To:     Charles Yeh <charlesyeh522@gmail.com>
Cc:     Johan Hovold <johan@kernel.org>,
        Greg KH <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org,
        =?utf-8?B?WWVoLkNoYXJsZXMgW+iRieamrumRq10=?= 
        <charles-yeh@prolific.com.tw>
Subject: Re: [PATCH] [PATCH v7] USB: serial: pl2303: Add new PID to support
 PL2303HXN (TYPE_HXN)
Message-ID: <20190923130804.GC30545@localhost>
References: <20190702123006.11320-1-charlesyeh522@gmail.com>
 <20190716084907.GB10939@localhost>
 <CAAZvQQ5pJDmZ-F8E8AhGxNK6ohuq3ev8OnySE-+zQNThBcu3Ag@mail.gmail.com>
 <20190920075602.GI30545@localhost>
 <CAAZvQQ6613eO6G0Gm-Sv3yWqTG_rRrynF=xVSLgz2uakXU2=ZQ@mail.gmail.com>
 <20190923102440.GA30545@localhost>
 <CAAZvQQ6MPrsfTcsnyD4DbKDVJf1WyLoxqW7q07k2RO1Cs5yd5Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAAZvQQ6MPrsfTcsnyD4DbKDVJf1WyLoxqW7q07k2RO1Cs5yd5Q@mail.gmail.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, Sep 23, 2019 at 06:35:19PM +0800, Charles Yeh wrote:
> Johan Hovold <johan@kernel.org> 於 2019年9月23日 週一 下午6:24寫道：
> > That looks much better. But please move the reset defines above the
> > flow control ones to keep the registers sorted by address (0x7 < 0xa).
> 
> Thank you for your reply
> 
> Charles Ans:
> The new define is follows
> 
> #define PL2303_READ_TYPE_HX_STATUS    0x8080
> 
> #define PL2303_HXN_RESET_REG    0x07
> #define PL2303_HXN_RESET_UPSTREAM_PIPE    0x02
> #define PL2303_HXN_RESET_DOWNSTREAM_PIPE    0x01
> 
> #define PL2303_HXN_FLOWCTRL_REG        0x0A
> #define PL2303_HXN_FLOWCTRL_MASK    0x1C
> #define PL2303_HXN_FLOWCTRL_NONE        0x1C
> #define PL2303_HXN_FLOWCTRL_RTS_CTS        0x18
> #define PL2303_HXN_FLOWCTRL_XON_XOFF    0x0C
> 
> 
> > Also looks good, thanks. Just move the reset define block as mentioned
> > above.
> 
> Thank you for your reply
> 
> 
> Please confirm the above new define
> If there is no problem.. I will write a new Patch file.

Yes, the above looks good.

Johan
