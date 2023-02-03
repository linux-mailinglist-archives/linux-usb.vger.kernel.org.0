Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8208A688CC9
	for <lists+linux-usb@lfdr.de>; Fri,  3 Feb 2023 02:53:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232088AbjBCBxh (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 2 Feb 2023 20:53:37 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37876 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232090AbjBCBxd (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 2 Feb 2023 20:53:33 -0500
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com [66.111.4.28])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C615041092
        for <linux-usb@vger.kernel.org>; Thu,  2 Feb 2023 17:53:32 -0800 (PST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
        by mailout.nyi.internal (Postfix) with ESMTP id 41BCB5C0190
        for <linux-usb@vger.kernel.org>; Thu,  2 Feb 2023 20:53:32 -0500 (EST)
Received: from imap42 ([10.202.2.92])
  by compute4.internal (MEProxy); Thu, 02 Feb 2023 20:53:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        flying-kestrel.ca; h=cc:content-type:date:date:from:from
        :in-reply-to:message-id:mime-version:reply-to:sender:subject
        :subject:to:to; s=fm3; t=1675389212; x=1675475612; bh=D/A5PTH3II
        eMuHVl8n0QzHC4irdwba2Vj0Nk4A0RHEI=; b=L+la9XYRzZuNU6wybCGWqhViDM
        el+fSbVqps4GtYMrkDls7+/i8JJ41IevKuXrzzDvrZRNZ8CtWMW2LknbHH9rz6Jp
        4xp1UCWdOche1i13ld2ALIv7DksAaEzh/o0s1IhE71h83PXSd2C5cOnHoMY/7z5N
        9irCArVH6uxlpWD1nH5cLTgqN8DVmmrix34J1SS4LQYJoQ6QsRRk9PWmHlVYPVT2
        Gf9N6yQYChiieCfajA4bUqosyrmuF51s2ogDehJbgkhfa/Y9LBQsWL4rNzO2N9Hc
        ONmCGU0kOdXwp/M45zFHkzBzxbK0nqdZMfo5AETljWB79YFPX8+pHHlILTIw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:date:feedback-id
        :feedback-id:from:from:in-reply-to:message-id:mime-version
        :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
        :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1675389212; x=
        1675475612; bh=D/A5PTH3IIeMuHVl8n0QzHC4irdwba2Vj0Nk4A0RHEI=; b=C
        5JDJFni5yxlloCt9BU+tjKlG/I7xQ8YSvKPpSX2RnxiqYbCk5kM8skghETTciYjH
        3bNvCgTcRWfyaJfi7UgPmLwp0GCPP26qFrsJoK9U8LODurkYZ4lwDobd9MjsTnnR
        h1B+eTlx47jB90KecWZsF2aFu49y9IjRcOmmi3zlLQxr/+uvJMg7vXVg0ZdOnSt3
        tpmx6xOiabEhPKHnhKPKLmmYSQ7VdIsQTPcKn+NnI/CwaEhmNuWZwhpt8NxTfDSo
        xnBrNTFjunAbPNBBMfuIjiTlCCkdUZMorKfcuCVlgeVkkDEyy2B/qaAb8ykpNvN9
        EXZxSUYo2l05cukeaidRw==
X-ME-Sender: <xms:HGncY-hlxU1jlbj6EctQw5Vene8q9EH9vm5o6uTNBRoo-nB8j4fbxg>
    <xme:HGncY_DvcOAle_102X-XscTLOA3R8cT9gQnGoC80H_sm9kX5y3DXyb2__xFd4vFlY
    SggU8-1UB33qNrP4qI>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrudefledgfeelucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpefofgggkfffhffvufgtsehttdertd
    erredtnecuhfhrohhmpehkvghsthhrvghluceokhgvshhtrhgvlhesfhhlhihinhhgqdhk
    vghsthhrvghlrdgtrgeqnecuggftrfgrthhtvghrnhepgfeiudetueeggfeiteeuhedvhf
    dvueeggffgffelgedufeffheekffetleelvdelnecuvehluhhsthgvrhfuihiivgeptden
    ucfrrghrrghmpehmrghilhhfrhhomhepkhgvshhtrhgvlhesfhhlhihinhhgqdhkvghsth
    hrvghlrdgtrg
X-ME-Proxy: <xmx:HGncY2EhSFA3SBZ5XziIjPsbmVoW4fIPqm7pkuv-B9-TuxoDhhFcdA>
    <xmx:HGncY3TIAiUU146V2zkiyOke6oNBnS3sLJkM4IFbLBlrlhIKFV_aKg>
    <xmx:HGncY7xVe-GXkyqetDvALTavkaOVRt0G5e1LF1FUNXadQ-ieDOGjww>
    <xmx:HGncY6-llf8vOuNt1uQBR9753NQo2ltBh22-Vj69Q_aUAou0RMQCPg>
Feedback-ID: ic1a947b3:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
        id 1B792BC0078; Thu,  2 Feb 2023 20:53:32 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.9.0-alpha0-107-g82c3c54364-fm-20230131.002-g82c3c543
Mime-Version: 1.0
Message-Id: <d8b951e5-c538-4235-b2a4-a26daf6ef541@app.fastmail.com>
Date:   Thu, 02 Feb 2023 18:52:38 -0700
From:   kestrel <kestrel@flying-kestrel.ca>
To:     linux-usb@vger.kernel.org
Subject: USB3/xHCI support for DWC3 gadgets?
Content-Type: text/plain
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi all,

I've been experimenting with a SBC that has a dwc3 USB DRD controller, and my next goal is to set up a USB ethernet gadget that runs at USB3 link speeds. my experiments have shown that USB3 speeds/USB3 in general is not supported while in device mode for dwc3. Can anyone with experience with the source code confirm if this is in fact the case?

I've been poking through the dwc3 driver source and don't see anything that specifically mentions usb3 in the gadget support, so it that seems plausible to me. If so, I may attempt to add support for it myself once I get some free time :)

Thank you!

Kestrel
