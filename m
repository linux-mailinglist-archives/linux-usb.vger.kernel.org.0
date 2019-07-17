Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 060F06B68C
	for <lists+linux-usb@lfdr.de>; Wed, 17 Jul 2019 08:21:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725932AbfGQGVT (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 17 Jul 2019 02:21:19 -0400
Received: from mail-lj1-f193.google.com ([209.85.208.193]:43927 "EHLO
        mail-lj1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725799AbfGQGVT (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 17 Jul 2019 02:21:19 -0400
Received: by mail-lj1-f193.google.com with SMTP id 16so22367318ljv.10
        for <linux-usb@vger.kernel.org>; Tue, 16 Jul 2019 23:21:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=yqQXzFX/eyjDDgAAiv+TG0sCyNilmQH5wiNvSSHEwws=;
        b=bf9YDHGRgY/35qeBS9QIAi7S+11Mswsk93uBjnsIq3FlP2xp8ZqCn9vfUGWhRBpz2l
         /HQqA5RgPyis75G29MHVhaqUDIoiEXRvd0LGjMYEJH4vYLVOXQVrMbAXgP4LABuWydOp
         xoE85+cFXxrcb/nSOGgTLOpj2HHE6xL3BIf2TkmtgidBLDWGbZhQOVm4A53Tev3fmqXC
         z6A0v7MnZfKMLvTyAH8VQXUrNOktcqNXNfNQDZR9oZWrwwOvyhW9rkLTFNfeGsSnDTJ4
         qZrYpuAVqc+0tpmeq+75K78zaJ1uIdbyBsfXULMq+hPFD+1wRbqVc9maEb4vP+SiDBaF
         5Y4g==
X-Gm-Message-State: APjAAAWEXKJ4EZgj980bfMnXp9C954xlx4vyCeyYaR/sAvwU/lxSdyb+
        oJZsEklx4MdrYqI0Bj5kBrg=
X-Google-Smtp-Source: APXvYqyyX/auSPuMV2AXzNmYG+hjCoJtPhk0W9+dC9/p2TaVDp/9nxm5qyhqKl+oe7iY5EK0ncUSYA==
X-Received: by 2002:a2e:8ed2:: with SMTP id e18mr19754806ljl.235.1563344477068;
        Tue, 16 Jul 2019 23:21:17 -0700 (PDT)
Received: from xi.terra (c-74bee655.07-184-6d6c6d4.bbcust.telenor.se. [85.230.190.116])
        by smtp.gmail.com with ESMTPSA id m25sm3236713lfc.83.2019.07.16.23.21.16
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 16 Jul 2019 23:21:16 -0700 (PDT)
Received: from johan by xi.terra with local (Exim 4.92)
        (envelope-from <johan@kernel.org>)
        id 1hndJU-0004Rl-81; Wed, 17 Jul 2019 08:21:16 +0200
Date:   Wed, 17 Jul 2019 08:21:16 +0200
From:   Johan Hovold <johan@kernel.org>
To:     Yoshiaki Okamoto <yokamoto@allied-telesis.co.jp>
Cc:     johan@kernel.org, hyamamo@allied-telesis.co.jp,
        linux-usb@vger.kernel.org
Subject: Re: [PATCH v2] USB: serial: option: Add support for ZTE MF871A
Message-ID: <20190717062116.GB16694@localhost>
References: <20190716090553.GA3522@localhost>
 <156334196350.13827.8927178214233271211.stgit@yokamoto-pc.rd.allied-telesis.co.jp>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <156334196350.13827.8927178214233271211.stgit@yokamoto-pc.rd.allied-telesis.co.jp>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, Jul 17, 2019 at 02:40:16PM +0900, Yoshiaki Okamoto wrote:
> This patch adds support for MF871A USB modem (aka Speed USB STICK U03)
> to option driver. This modem is manufactured by ZTE corporation, and
> sold by KDDI.
> 
> Interface layout:
> 0: AT
> 1: MODEM
> 
> usb-devices output:
> T:  Bus=01 Lev=01 Prnt=01 Port=00 Cnt=01 Dev#=  9 Spd=480 MxCh= 0
> D:  Ver= 2.00 Cls=00(>ifc ) Sub=00 Prot=00 MxPS=64 #Cfgs=  1
> P:  Vendor=19d2 ProdID=1481 Rev=52.87
> S:  Manufacturer=ZTE,Incorporated
> S:  Product=ZTE Technologies MSM
> S:  SerialNumber=1234567890ABCDEF
> C:  #Ifs= 2 Cfg#= 1 Atr=80 MxPwr=500mA
> I:  If#= 0 Alt= 0 #EPs= 3 Cls=ff(vend.) Sub=00 Prot=00 Driver=option
> I:  If#= 1 Alt= 0 #EPs= 3 Cls=ff(vend.) Sub=00 Prot=00 Driver=option
> 
> Co-developed-by: Hiroyuki Yamamoto <hyamamo@allied-telesis.co.jp>
> Signed-off-by: Hiroyuki Yamamoto <hyamamo@allied-telesis.co.jp>
> Signed-off-by: Yoshiaki Okamoto <yokamoto@allied-telesis.co.jp>
> ---
> 
> Changes in v2:
> - Add Co-developed-by tag.
> - Move away product-id define and add short comment after the entry.

Perfect, thanks for the update. I'll queue this one up after the merge
window closes.

Johan
