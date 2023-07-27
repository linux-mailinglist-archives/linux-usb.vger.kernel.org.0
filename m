Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 79F8D765AB9
	for <lists+linux-usb@lfdr.de>; Thu, 27 Jul 2023 19:49:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230416AbjG0RtT (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 27 Jul 2023 13:49:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41636 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229481AbjG0RtS (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 27 Jul 2023 13:49:18 -0400
X-Greylist: delayed 549 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Thu, 27 Jul 2023 10:49:16 PDT
Received: from out-111.mta0.migadu.com (out-111.mta0.migadu.com [91.218.175.111])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ABB50113
        for <linux-usb@vger.kernel.org>; Thu, 27 Jul 2023 10:49:16 -0700 (PDT)
MIME-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zatta.me; s=key1;
        t=1690479606;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=WmmQ5LVACxcXV4cAUaslsjQzJoj+UGNbt4BkBh3OSDc=;
        b=I5/QOUZ5dMmqVeV5xZY7QygrRFOKbAtkk7OoWst0b8KtsCukFAgVQK2cJn/ndaHyU/TzUo
        +j5K1/crpxUlFA08fWSFfHSKFBCu8Fuwu3Ge5L6BgKBKBqRTnOWc4ViuQbWZ4l2RwYvTn5
        jOTMdzOH/Wdmr6C/EgBJdY+r5rWPZ50=
Date:   Thu, 27 Jul 2023 17:40:05 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From:   marco@zatta.me
Message-ID: <42deca715b9860e7dfa5d9a78befcd01bd122910@zatta.me>
TLS-Required: No
Subject: Re: Something is really broken for Logitech webcams
To:     "Oliver Neukum" <oneukum@suse.com>,
        "Laurent Pinchart" <laurent.pinchart@ideasonboard.com>
Cc:     "USB list" <linux-usb@vger.kernel.org>
In-Reply-To: <6dcde4c2-9400-44af-c8b4-5e63b947a2bf@suse.com>
References: <6dcde4c2-9400-44af-c8b4-5e63b947a2bf@suse.com>
X-Migadu-Flow: FLOW_OUT
X-Spam-Status: No, score=-0.2 required=5.0 tests=BAYES_20,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

July 27, 2023 at 1:48 PM, "Oliver Neukum" <oneukum@suse.com> wrote:


>=20
>=20And Marco specifically, did you make your patch based on a bisection?
>

No, I just reverted an old commit that removed that webcam from the quirk=
s list.

Best regards,
Marco
