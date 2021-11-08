Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 10CA4448007
	for <lists+linux-usb@lfdr.de>; Mon,  8 Nov 2021 14:08:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238950AbhKHNKv (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 8 Nov 2021 08:10:51 -0500
Received: from mail.kernel.org ([198.145.29.99]:45810 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230303AbhKHNKv (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 8 Nov 2021 08:10:51 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 426EA610A3;
        Mon,  8 Nov 2021 13:08:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1636376886;
        bh=bj/44GOaEYn/oc6G4GCZyTMbO8CLeGl7MkVSo3yUrwE=;
        h=References:From:To:Cc:Subject:Date:In-reply-to:From;
        b=bKTM1ewVi1gqEMDwbfDCJwB7Yt8R9IgXic6pFasJnchFd5AzXYJOT1TD2+o+TkovP
         Vj8phmn75FMout/Rqhv1qvIpLhLp2XduzB6SXy/e0G+ZdRWZ+aV7pWd9FnaDEggeJC
         gvE4SPQa7p7iZ+u4QYnV/ccVjtLCsQPoHWXQLFQKS9YstSz3dLd0kNMCyLhwMdv7Kv
         dzDx6Xu0Q08/Mun5ljkrnZrH2ycaIcOeoa1JB+oD+G0Bgh936mdjfUgzaip7RBRdv5
         UW54Nq/CWXbUYtEPq7YCmHCUZQuVir7kj7NtSIVpdsDZ/C1gQ/Os3Eg7dVFNh6533W
         9z7Voc6Kc87/w==
References: <CABEcMwWwsa1Q_mZaf=QUQb-Gc-xe=gmL6F2v3BPGyrJ7-mfB2g@mail.gmail.com>
User-agent: mu4e 1.6.6; emacs 28.0.60
From:   Felipe Balbi <balbi@kernel.org>
To:     Shantur Rathore <i@shantur.com>
Cc:     linux-usb@vger.kernel.org
Subject: Re: usb-gadget: dynamic reconfiguration
Date:   Mon, 08 Nov 2021 15:07:26 +0200
In-reply-to: <CABEcMwWwsa1Q_mZaf=QUQb-Gc-xe=gmL6F2v3BPGyrJ7-mfB2g@mail.gmail.com>
Message-ID: <87sfw6eqx8.fsf@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org


Hi,

Shantur Rathore <i@shantur.com> writes:
> Hi all,
>
> I am trying to figure out if it's possible to reconfigure a usb-gadget
> when it's live.
> The idea is to create a gadget with 1 function - lets say a serial gadget.
>
> Upon communication with the host, the host could specify (via Serial
> communication) which is the next gadget it needs for example a mass
> storage or ecm and the next gadget can be added to the configuration.
>
> For now this only works if the gadget is disconnected and reconnected
> to the UDC.
>
> I want to understand if it is technically possible to add more
> functions to a live config without affecting existing functions.

the only thing you can do is upon a certain command, logically
disconnect from the bus and connect again as a new device.

-- 
balbi
