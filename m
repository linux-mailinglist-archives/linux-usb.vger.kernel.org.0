Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A06D12F37F2
	for <lists+linux-usb@lfdr.de>; Tue, 12 Jan 2021 19:09:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2392132AbhALSIh (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 12 Jan 2021 13:08:37 -0500
Received: from mail.kernel.org ([198.145.29.99]:57478 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2391051AbhALSIh (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 12 Jan 2021 13:08:37 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 0972822DFA;
        Tue, 12 Jan 2021 18:07:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1610474876;
        bh=DVrIj4de4oYekmSc/sNh7PV7Q2Q9sHymqZavDrk6toQ=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=VddWMlobtK5uezupuqhBclY1sdbTaSX5W9kztwSffEi41ndFUnlBXN1CfnNsWEerY
         js0sQAkpvmXt1uJpJqBeYiYgtcUmUiCuCwgU5EvKYdghhUXoRyDDh7eu7fOYOV25z2
         qFDpHJGFpCMQLX6ulBCDAwDZHHuK8QYFMPvJN/0E=
Date:   Tue, 12 Jan 2021 19:09:04 +0100
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Rob Herring <robh@kernel.org>
Cc:     devicetree@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Biju Das <biju.das.jz@bp.renesas.com>,
        linux-usb@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: usb: Use OF graph schema
Message-ID: <X/3lwD1/mmpBTU1L@kroah.com>
References: <20210112153527.391232-1-robh@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210112153527.391232-1-robh@kernel.org>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Jan 12, 2021 at 09:35:27AM -0600, Rob Herring wrote:
> Now that we have a graph schema, rework the USB related schemas to use
> it. Mostly this is adding a reference to graph.yaml and dropping duplicate
> parts from schemas.
> 
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Cc: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> Cc: Biju Das <biju.das.jz@bp.renesas.com>
> Cc: linux-usb@vger.kernel.org
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---
>  .../devicetree/bindings/usb/renesas,usb3-peri.yaml        | 7 ++++---
>  Documentation/devicetree/bindings/usb/ti,hd3ss3220.yaml   | 8 ++++----
>  2 files changed, 8 insertions(+), 7 deletions(-)

Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
