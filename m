Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 71521462D76
	for <lists+linux-usb@lfdr.de>; Tue, 30 Nov 2021 08:26:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234485AbhK3H3w (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 30 Nov 2021 02:29:52 -0500
Received: from ams.source.kernel.org ([145.40.68.75]:52240 "EHLO
        ams.source.kernel.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229655AbhK3H3w (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 30 Nov 2021 02:29:52 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 024F0B80945
        for <linux-usb@vger.kernel.org>; Tue, 30 Nov 2021 07:26:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7CC2FC53FC7;
        Tue, 30 Nov 2021 07:26:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1638257191;
        bh=K/bZn8333Pvg8s4Ao1mB25J/rMtI6ZOhVJA84/gHvVI=;
        h=References:From:To:Cc:Subject:Date:In-reply-to:From;
        b=pUDpBoDgdNdh7thMAcraXv6jbfOxS4a+lQemRJ343Nt2ffQoLIXR2DCXAFJsMgp/g
         RHbyNoHKuVradVvQyrEQOXvDGv2hiD51IniOmVu68RCw13CDdnspyWWJb0q7eGYdWM
         cxrzGK1faiVf0GgDFxhk5htQN6KdfMV0GO8Wq5xTGRNLbe7vPZ8xURraw9lSgjkAnQ
         QuWwL6hbpsB/+j3Ks0/uRNgeknRisER1+flTM+d9IhYUC4QsRPKa51NE+l6R3v4ZSr
         mqR8Zv1Cc5irQYDEb1RLhBktEO0C776cMjTu6hIReH1TVHqpImLNKaOS0oVU4RCs9b
         q6gKb+SZICzwg==
References: <cd9c7a8bf11f790983ac546222dd114893f16b3a.1638242424.git.Thinh.Nguyen@synopsys.com>
User-agent: mu4e 1.6.10; emacs 28.0.60
From:   Felipe Balbi <balbi@kernel.org>
To:     Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org, John Youn <John.Youn@synopsys.com>
Subject: Re: [PATCH] usb: dwc3: gadget: Support Multi-Stream Transfer
Date:   Tue, 30 Nov 2021 09:23:36 +0200
In-reply-to: <cd9c7a8bf11f790983ac546222dd114893f16b3a.1638242424.git.Thinh.Nguyen@synopsys.com>
Message-ID: <87zgpmyuho.fsf@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org


Hi Thinh,

Thinh Nguyen <Thinh.Nguyen@synopsys.com> writes:
> Synopsys introduced a new enhancement to DWC_usb32 called Multi-Stream
> Transfer (MST) to improve bulk streams performance for SuperSpeed and
> SuperSpeed Plus. This enhancement allows the controller to look ahead
> and process multiple bulk streams.

Finally!! This is a great improvement to the core :-)

> Previously, to initiate a bulk stream transfer, the driver has to issue
> Start Transfer command and wait for the stream to complete before
> initiating a new stream. As a result, the controller does not process
> TRBs beyond a single stream. With the enhancement, as long as there are
> new requests, the dwc3 driver can keep preparing new TRBs and the
> controller can keep caching and processing them without waiting for the
> transfer completion.
>
> The programming flow is similar to regular bulk endpoint with a few
> additional rules:
>
> 1) Chained TRBs of the same stream must have a matching stream ID
> 2) The last TRB of a stream must have CHN=0
> 3) All the TRBs with LST=0 must have CSP=1
>
> Depends on the application and usage, internal tests show significant
> performance improvement in UASP transfers with this enhancement.

Does this mean that we can now issue Start Transfer for each of the
streams on the same endpoint? Should we start having per-stream TRBs,
then? Maybe we don't need a full 256 TRBs for each stream, perhaps 16 to
32 TRBs for each stream ought to be enough?

-- 
balbi
