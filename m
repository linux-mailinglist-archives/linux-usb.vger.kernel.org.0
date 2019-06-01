Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DC83231B2D
	for <lists+linux-usb@lfdr.de>; Sat,  1 Jun 2019 12:11:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726142AbfFAKLl (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 1 Jun 2019 06:11:41 -0400
Received: from mx.zatta.me ([185.52.2.58]:60406 "EHLO mx.zatta.me"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726089AbfFAKLl (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Sat, 1 Jun 2019 06:11:41 -0400
Date:   Sat, 1 Jun 2019 12:11:37 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=zatta.me;
        s=myselector; t=1559383899;
        bh=deaXTXvdHGXwh37M+oDQM17zgn2fvYB3CIB8Uqs1N68=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To;
        b=xxMHK7fpsFFd8Umb+bHPAlYCXeXPDSQB+sbH1PxXupyY9fNSJVCF0fkOarGfw3U/h
         sIrmIYe9NS8CTOCA0jSKTwaXfxMfEJOdxxt2COIBizFAVSJH+j4VeDNqv+lRKjo2RT
         77x4BbckIYma9SjgnPKoIWsciICotzWHFaJ0SY3T1UucxPbsg4Bbtej9GmMgPrkac1
         ZfTONWclFEiDO/3v0lmyW1CJWjqBeM2ucLfzMmPwcC4B23qW96Bn1trNvrf/DfbYr+
         ka8+bEJGWpG1iOQFoc4BPA3MUNQXxteKLTCL0TdN3oLpxT8+lp34qULJuEkye2doA2
         VxiTF406741/Q==
From:   Marco Zatta <marco@zatta.me>
To:     Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org
Subject: Re: [PATCH] Fix chipmunk-like voice when using Logitech C270 for
 recording audio.
Message-ID: <20190601101137.GA1988@jimmy.localdomain>
References: <20190601075257.GA24550@jimmy.localdomain>
 <e77aaee7-ddcb-58ff-2dcf-d1fff21a9e07@cogentembedded.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e77aaee7-ddcb-58ff-2dcf-d1fff21a9e07@cogentembedded.com>
User-Agent: Mutt/1.12.0 (2019-05-25)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi!
On Sat, Jun 01, 2019 at 12:33:06PM +0300, Sergei Shtylyov wrote:
> Hello!
> 
> On 01.06.2019 10:52, Marco Zatta wrote:
> 
> > This patch fixes the chipmunk-like voice that manifets randomly when
> > using the integrated mic of the Logitech Webcam HD C270.
> > 
> > The issue was solved initially for this device by commit
> > 2394d67e446bf616a0885167d5f0d397bdacfdfc but it was then reintroduced by
> > e387ef5c47ddeaeaa3cbdc54424cdb7a28dae2c0. This patch is to have the fix
> 
>    It's not how you should cite the commits, see below:
> 
> <12-digit SHA1> ("<summary>")
> 

You are right, I am sorry about that. The commits are
2394d67e446bf616a0885167d5f0d397bdacfdfc ("USB: add RESET_RESUME for
webcams shown to be quirky") and
e387ef5c47ddeaeaa3cbdc54424cdb7a28dae2c0 ("usb: Add
USB_QUIRK_RESET_RESUME for all Logitech UVC webcams")

> > back.
> > 
> > Signed-off-by: Marco Zatta <marco@zatta.me>
> [...]
> 
> MBR, Sergei

Best regards,
Marco
