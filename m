Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D831817E0F2
	for <lists+linux-usb@lfdr.de>; Mon,  9 Mar 2020 14:18:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726512AbgCINSn (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 9 Mar 2020 09:18:43 -0400
Received: from mail2-relais-roc.national.inria.fr ([192.134.164.83]:47310 "EHLO
        mail2-relais-roc.national.inria.fr" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725956AbgCINSn (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 9 Mar 2020 09:18:43 -0400
X-IronPort-AV: E=Sophos;i="5.70,533,1574118000"; 
   d="scan'208";a="439490233"
Received: from dt-lawall.paris.inria.fr ([128.93.67.65])
  by mail2-relais-roc.national.inria.fr with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 09 Mar 2020 14:18:41 +0100
Date:   Mon, 9 Mar 2020 14:18:41 +0100 (CET)
From:   Julia Lawall <julia.lawall@inria.fr>
X-X-Sender: julia@hadrien
To:     Payal Kshirsagar <payalskshirsagar1234@gmail.com>
cc:     manishc@marvell.com, GR-Linux-NIC-Dev@marvell.com,
        gregkh@linuxfoundation.org, outreachy-kernel@googlegroups.com,
        linux-usb@vger.kernel.org
Subject: Re: [PATCH 0/3] [Outreachy kernel] staging: qlge: qlge.h: cleanup
 suggested by checkpatch
In-Reply-To: <cover.1583759118.git.payalskshirsagar1234@gmail.com>
Message-ID: <alpine.DEB.2.21.2003091417490.4721@hadrien>
References: <cover.1583759118.git.payalskshirsagar1234@gmail.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org



On Mon, 9 Mar 2020, Payal Kshirsagar wrote:

> Cleanup suggested by checkpatch for the file drivers/staging/qlge/qlge.h.
>
> Payal Kshirsagar (3):
>   [Outreachy kernel] staging: qlge: remove spaces before tabs and align
>     code
>   [Outreachy kernel] staging: qlge: qlge.h: add spaces around operators
>   [Outreachy kernel] staging: qlge: qlge.h: remove excess newlines

It's strange that the information about the location is different in the
first case than in the other two cases, if they are all touching the same
file?

julia

>
>  drivers/staging/qlge/qlge.h | 69 ++++++++++++++++++-------------------
>  1 file changed, 33 insertions(+), 36 deletions(-)
>
> --
> 2.17.1
>
> --
> You received this message because you are subscribed to the Google Groups "outreachy-kernel" group.
> To unsubscribe from this group and stop receiving emails from it, send an email to outreachy-kernel+unsubscribe@googlegroups.com.
> To view this discussion on the web visit https://groups.google.com/d/msgid/outreachy-kernel/cover.1583759118.git.payalskshirsagar1234%40gmail.com.
>
