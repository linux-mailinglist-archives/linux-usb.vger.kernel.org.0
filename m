Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7ECD1E0DC
	for <lists+linux-usb@lfdr.de>; Mon, 29 Apr 2019 12:52:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727857AbfD2KwM (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 29 Apr 2019 06:52:12 -0400
Received: from mail-wr1-f68.google.com ([209.85.221.68]:43556 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727767AbfD2KwM (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 29 Apr 2019 06:52:12 -0400
Received: by mail-wr1-f68.google.com with SMTP id a12so15299908wrq.10
        for <linux-usb@vger.kernel.org>; Mon, 29 Apr 2019 03:52:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:subject:to:cc:references:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=BlH2+2dT8DBceBf7g6p1pnr3mj+D4ldrgPjNPWpGkFA=;
        b=a+lWFkWCn7SzQPH12EobCZkEwlCUKdZQ6aBPNfYrxVMz2P7zVHyHmcnbVlKXcjXLsN
         9KG/nLWX0k7WpXXnDBdm810SD+7u45uFXf7yjyb+IAAC5m74vRE1bIPBEP2s4K0dB2Vb
         iraHyQRQjYuKvbm8Z10CHUssqU4Mh3PU3nzFQNoF16AFIGQAIhqgjciS/BsrgE9QCGbi
         EEG2fDc0iUQHpx00MecEUsLHq5H1RLbKqxFBByvpao/3mkqKN8mwwEsREp+uKMmkO8hL
         EuVKEBa8qxZCHdB2GsHyGKQQ8G3+b++QAzecfECm4Sy0/PA5BTL3/qRJAdbnwBLqY7Wu
         Qasg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:subject:to:cc:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=BlH2+2dT8DBceBf7g6p1pnr3mj+D4ldrgPjNPWpGkFA=;
        b=qow0QYenpi8yBSPcE7rlO58soT8gB7eqKWmvHY7zn1JzI75y8cPlTpmEWIe+bMeVir
         vKksHCYmX7paa9BAI3L5eHeNPjoI40P1eZZtsQbKjfNjyF29r6sqKZHdnXuEqIoPWhBR
         hfZaiHd4HaDHFxb1GTDK+ws4TGqzksURSFaA8CIyvpANa98rxBkmRQEISbcJoRRs36FI
         MxWlsWLjmSRvwFG3nuyBvXLbtmSD/oUkcsOZmaSJZI3T56fxiTIVbuQ12pBKe4232Z0U
         QU/Oto1kt8CQ9bdsb7dLePI6F1mYS1pcyq5SNW3LZNYWpRilarO+jaZOea4s7Q3YAXZF
         Kvpw==
X-Gm-Message-State: APjAAAUmI0vON+KQRpjDZu6T1lmhNspsy4iKechXFviMaysMakxIJ120
        zHGHgvw/K4tp6kxnn4QaAwo=
X-Google-Smtp-Source: APXvYqwTlIKhawd3e/E7t+s7vNZEZjhgL2Ez3LAhCr836dwrQ/8DQk6h3Z/LLH+ex2dUaR2tBCHDqQ==
X-Received: by 2002:a5d:4e82:: with SMTP id e2mr1287347wru.199.1556535131064;
        Mon, 29 Apr 2019 03:52:11 -0700 (PDT)
Received: from [192.168.99.70] (mail.unidataz.cz. [193.165.148.130])
        by smtp.googlemail.com with ESMTPSA id s132sm6990652wms.10.2019.04.29.03.52.09
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 29 Apr 2019 03:52:09 -0700 (PDT)
From:   "StarostaCZ@gmail.com" <starostacz@gmail.com>
X-Google-Original-From: "StarostaCZ@gmail.com" <StarostaCZ@gmail.com>
Subject: Re: Linux crash when using FTDI FT232R USB to serial converter on AMD
 boards.
To:     Johan Hovold <johan@kernel.org>
Cc:     linux-usb@vger.kernel.org, Mathias Nyman <mathias.nyman@intel.com>,
        Joerg Roedel <joro@8bytes.org>,
        iommu@lists.linux-foundation.org
References: <04503197-a0a9-8b35-6c65-c10f296aab57@gmail.com>
 <20190429094847.GI26546@localhost>
Message-ID: <26c4a175-dae2-3410-6924-92fe7c8ec6fe@gmail.com>
Date:   Mon, 29 Apr 2019 12:51:20 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190429094847.GI26546@localhost>
Content-Type: text/plain; charset=iso-8859-2; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: cs
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hello,
sorry for other questions, but I am new in this list:
Is Ubuntu server 19.04 with "kernel 5.0.9-050009-generic" good for this 
test?
Can I add attachments to this lists?
And who is xhci and iommu maintainers? Are they CC in this mail?

starosta

Dne 29.4.2019 v 11:48 Johan Hovold napsal(a):
> So this is a debian 4.18 kernel seemingly crashing due to a xhci or
> iommu issue.
>
> Can you reproduce this on a mainline kernel?
>
> If so, please post the corresponding logs to the lists and CC the xhci
> and iommu maintainers (added to CC).

