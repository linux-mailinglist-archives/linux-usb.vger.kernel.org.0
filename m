Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8EC0562B4B9
	for <lists+linux-usb@lfdr.de>; Wed, 16 Nov 2022 09:14:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233070AbiKPIOF (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 16 Nov 2022 03:14:05 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48944 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238642AbiKPINn (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 16 Nov 2022 03:13:43 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6363AE09B
        for <linux-usb@vger.kernel.org>; Wed, 16 Nov 2022 00:11:29 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 0CE8BB81C10
        for <linux-usb@vger.kernel.org>; Wed, 16 Nov 2022 08:11:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AE57EC433C1;
        Wed, 16 Nov 2022 08:11:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1668586286;
        bh=cLG025rz1BWtDMbszGiCNEadWg7IaW8EF32Aq5w2N+0=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=i5y2C9/wBBdxMd26kbe5cAHqYbsa0xxYNS0dl5VCdXZFPFDRQ7QO3M3Y8IpxQ5tqX
         btEPrzgjgIWNTS6YHP5lN1X9Lid6xhnfYYQBrUKDRfOSlQ7ddEO0Ct9ZFysEo9sHI7
         JVG/teDJIW5pdMG1JHs2/mNHpDwgPVQJRf6VNh4Oglk++diz9l1gizCKFrPlEcHN5u
         y9sHzHn0U42elc/U//kWHPj4EZXexvHSuVoWhMjPJYsV/H6m7SUJLMFLAXj6WuEHih
         5yhTIFnoV360usgXXDyiPUOUkWyNXpWRz3QjpoG7/gsj87LUBVW0RBjqGygsH3EV7T
         EudeRDUQeId7A==
Received: from johan by xi.lan with local (Exim 4.94.2)
        (envelope-from <johan@kernel.org>)
        id 1ovDVY-0003rU-38; Wed, 16 Nov 2022 09:10:56 +0100
Date:   Wed, 16 Nov 2022 09:10:56 +0100
From:   Johan Hovold <johan@kernel.org>
To:     Davide Tronchin <davide.tronchin.94@gmail.com>
Cc:     cesare.marzano@gmail.com, gregkh@linuxfoundation.org,
        larsm17@gmail.com, linux-usb@vger.kernel.org,
        marco.demarco@posteo.net
Subject: Re: [PATCH v4 3/3] USB: serial: option: add u-blox LARA-L6 modem
Message-ID: <Y3SbEE31SnLkeMd+@hovoldconsulting.com>
References: <Y3NodufBpWHAl1qG@hovoldconsulting.com>
 <20221115165000.38682-1-davide.tronchin.94@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221115165000.38682-1-davide.tronchin.94@gmail.com>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Nov 15, 2022 at 05:50:00PM +0100, Davide Tronchin wrote:
> Sorry i have not commented because i tought the latest v5 patch version
> was sufficient to understand.
> RSVD(4) has been removed because in normal mode interface 4 is not used.

My apologies. I thought I was reviewing v5 and that it was still there.

All good then. Just amend the commit message in 1/3, and wrap all the
commit messages at 72 column or so.

Johan
