Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5BD05526584
	for <lists+linux-usb@lfdr.de>; Fri, 13 May 2022 17:01:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1378147AbiEMPB0 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 13 May 2022 11:01:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57212 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1381892AbiEMPBN (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 13 May 2022 11:01:13 -0400
Received: from louie.mork.no (louie.mork.no [IPv6:2001:41c8:51:8a:feff:ff:fe00:e5])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A2A653F890
        for <linux-usb@vger.kernel.org>; Fri, 13 May 2022 08:00:57 -0700 (PDT)
Received: from canardo.dyn.mork.no ([IPv6:2a01:799:c9d:7e00:0:0:0:1])
        (authenticated bits=0)
        by louie.mork.no (8.15.2/8.15.2) with ESMTPSA id 24DF0c78424148
        (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=OK);
        Fri, 13 May 2022 16:00:42 +0100
Received: from miraculix.mork.no ([IPv6:2a01:799:c9d:7e02:9be5:c549:1a72:4709])
        (authenticated bits=0)
        by canardo.dyn.mork.no (8.15.2/8.15.2) with ESMTPSA id 24DF0X4a2538508
        (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=OK);
        Fri, 13 May 2022 17:00:33 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mork.no; s=b;
        t=1652454033; bh=KCVriRaP01EnySZ+djQZE3My9dvgxWD17A2ku7q5+lE=;
        h=From:To:Cc:Subject:References:Date:Message-ID:From;
        b=fJu2+wnh3/tpC/2CxgdscxlvVjpA743Ojyh3JLwVEeDQmFMWa2tyGBb/B+4fOdZRI
         BXpXMuBTctE44D7rF0at1y4YVIjsDJVn5SZquC/QHFFeEq/zmMoNHFsfQrPFHQk0HD
         G6lS/mYJBkxUO7JMyAX7YbInEO0+vo/g6lACveVQ=
Received: (nullmailer pid 424563 invoked by uid 1000);
        Fri, 13 May 2022 15:00:32 -0000
From:   =?utf-8?Q?Bj=C3=B8rn_Mork?= <bjorn@mork.no>
To:     Alan Stern <stern@rowland.harvard.edu>
Cc:     Greg KH <gregkh@linuxfoundation.org>,
        Jose Ignacio Tornos Martinez <jtornosm@redhat.com>,
        linux-usb@vger.kernel.org, Marcel Holtmann <marcel@holtmann.org>
Subject: Re: [PATCH v5] USB: core: skip unconfiguration if device doesn't
 support it
Organization: m
References: <20220504151647.471885-1-jtornosm@redhat.com>
        <Ynzz6Jh5OeEikvfh@kroah.com>
        <CABk-BGte9qHwmdqCU6oZ9-E3LvOqcMf3z46e00hypNdD_hPxPQ@mail.gmail.com>
        <Yn5mliJq+7W8khe9@rowland.harvard.edu> <Yn5nc2mSHrdy/8h6@kroah.com>
        <Yn5qerFAcHP3scAZ@rowland.harvard.edu>
Date:   Fri, 13 May 2022 17:00:32 +0200
In-Reply-To: <Yn5qerFAcHP3scAZ@rowland.harvard.edu> (Alan Stern's message of
        "Fri, 13 May 2022 10:26:02 -0400")
Message-ID: <87zgjl8okv.fsf@miraculix.mork.no>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Virus-Scanned: clamav-milter 0.103.5 at canardo
X-Virus-Status: Clean
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Alan Stern <stern@rowland.harvard.edu> writes:

> (Greg, did that program or something like it ever get added to the
> usbutils package?)

(your) usbreset.c was added to usbutils in 2016 :-)


Bj=C3=B8rn
