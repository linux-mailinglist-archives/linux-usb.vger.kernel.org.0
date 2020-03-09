Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3356217E2AE
	for <lists+linux-usb@lfdr.de>; Mon,  9 Mar 2020 15:46:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726784AbgCIOqu (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 9 Mar 2020 10:46:50 -0400
Received: from mail2-relais-roc.national.inria.fr ([192.134.164.83]:64744 "EHLO
        mail2-relais-roc.national.inria.fr" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726799AbgCIOqu (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 9 Mar 2020 10:46:50 -0400
X-IronPort-AV: E=Sophos;i="5.70,533,1574118000"; 
   d="scan'208";a="439510734"
Received: from dt-lawall.paris.inria.fr ([128.93.67.65])
  by mail2-relais-roc.national.inria.fr with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 09 Mar 2020 15:46:49 +0100
Date:   Mon, 9 Mar 2020 15:46:49 +0100 (CET)
From:   Julia Lawall <julia.lawall@inria.fr>
X-X-Sender: julia@hadrien
To:     Payal Kshirsagar <payalskshirsagar1234@gmail.com>
cc:     manishc@marvell.com, GR-Linux-NIC-Dev@marvell.com,
        gregkh@linuxfoundation.org, outreachy-kernel@googlegroups.com,
        linux-usb@vger.kernel.org
Subject: Re: [PATCH 0/3] [Outreachy kernel] staging: qlge: qlge.h: cleanup
 suggested by checkpatch
In-Reply-To: <CAJyzNhno1e9enuSdAstwa_i03Xb5Sz4sQiadUukaADruQ2dGxw@mail.gmail.com>
Message-ID: <alpine.DEB.2.21.2003091546050.4721@hadrien>
References: <cover.1583759118.git.payalskshirsagar1234@gmail.com> <alpine.DEB.2.21.2003091417490.4721@hadrien> <CAJyzNhno1e9enuSdAstwa_i03Xb5Sz4sQiadUukaADruQ2dGxw@mail.gmail.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-1056257730-1583765209=:4721"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1056257730-1583765209=:4721
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT



On Mon, 9 Mar 2020, Payal Kshirsagar wrote:

>
>
> On Mon, Mar 9, 2020, 6:48 PM Julia Lawall <julia.lawall@inria.fr> wrote:
>
>
>       On Mon, 9 Mar 2020, Payal Kshirsagar wrote:
>
>       > Cleanup suggested by checkpatch for the file
>       drivers/staging/qlge/qlge.h.
>       >
>       > Payal Kshirsagar (3):
>       >   [Outreachy kernel] staging: qlge: remove spaces before tabs
>       and align
>       >     code
>       >   [Outreachy kernel] staging: qlge: qlge.h: add spaces around
>       operators
>       >   [Outreachy kernel] staging: qlge: qlge.h: remove excess
>       newlines
>
>       It's strange that the information about the location is
>       different in the
>       first case than in the other two cases, if they are all touching
>       the same
>       file?
>
>
> Yes, all the patches of this series cleaning a same file, the subject line
> in first patch of this series was my mistake.
> What I supposed to do now ?

Resend the series.  Explain under the --- what you changed in the patch
that you changed.  For the other two, say under the --- that nothing has
changed.

julia
--8323329-1056257730-1583765209=:4721--
