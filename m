Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D116170BB28
	for <lists+linux-usb@lfdr.de>; Mon, 22 May 2023 13:08:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233199AbjEVLIf (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 22 May 2023 07:08:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53960 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232988AbjEVLH4 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 22 May 2023 07:07:56 -0400
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com [IPv6:2a00:1450:4864:20::336])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6462F19A9
        for <linux-usb@vger.kernel.org>; Mon, 22 May 2023 04:03:06 -0700 (PDT)
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-3f475366514so39975575e9.2
        for <linux-usb@vger.kernel.org>; Mon, 22 May 2023 04:03:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684753350; x=1687345350;
        h=to:subject:message-id:date:from:sender:reply-to:mime-version:from
         :to:cc:subject:date:message-id:reply-to;
        bh=XzkOlJkL0xv5A0elXPgvm4hIibRPFdeBQcjY85MGTHg=;
        b=YpWQlbeQBknOJNcNvixUy5XcxwaulDkWGtKnZC2mgcWARNbP7s0naqRRsEBMU3kmK5
         aWrda2pHtaEhLRSi6KQBqXXsx/hjzdlBgTqbkTPM4tCYahx0e/MYoBuETHkHEm9fU/Gr
         Xn5f8AsYryILt7PF4sXWyhOygQ8zHDSg/omYeGbIu02iVb656UjcwmEHHss1TWmjcUv8
         jshCiGFNArerSIWQ9GlYMRMjhTxCiAcaJeK+6p1GFWp//Ry1J9kgXx7pxCXMvdWh0B1i
         4K/uED4p2azk9+pcdv7QIMdGDktuPsYx5jTYaVvt6Z2FodCp2WoRrUMdkP0X/tuhZDhf
         1dAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684753350; x=1687345350;
        h=to:subject:message-id:date:from:sender:reply-to:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XzkOlJkL0xv5A0elXPgvm4hIibRPFdeBQcjY85MGTHg=;
        b=EDLJi7KNcGlgFkkyrNCnBielSx87iCJjps/COoUBiv/qQmbQ7bv1u1K7SzFDelijNa
         4rYAdI/Sa1JZU5N7w6leJ2xuEO3GQWE+SzLiDnf1Z7f+Z/iiTCLyuUDdQ9SRhpzwge7j
         kIB0sPY4HFOik4BxsBuCMdG0fOFloY2OjS8xVTK6k4NUi+k9OFbR0sBwc0VN8SgaH3fF
         KV8ELuzSU5UEMpWJbsQFhw5YElJoA6uf0bLGYyic31z5rCQeVbaoXanqYMEFxd36uGIi
         pbAogczsWGUVuBZlsaV0ALi6e+x4A230h1raj60gvEUa5KNFh/fboEPQt5CDCt1E5CGZ
         y26w==
X-Gm-Message-State: AC+VfDzzSD12nwrICeZIPqVkqyoiP/hlfjiRg6Bo+1oeZpAnFQb8WLgL
        1uOHwaiGnh5Lq5njIxeLfaX2VLrNxgzdd97MxTs=
X-Google-Smtp-Source: ACHHUZ51eDyf510Z/A8Epqh5R3twZA6dBjo5fqmcYGrdIVabXrmA7G/IeQZHkTdi39kD3ui+AlyMwPrGE+qJrvcWYtw=
X-Received: by 2002:a1c:7209:0:b0:3f5:fb83:62b0 with SMTP id
 n9-20020a1c7209000000b003f5fb8362b0mr3919122wmc.36.1684753350148; Mon, 22 May
 2023 04:02:30 -0700 (PDT)
MIME-Version: 1.0
Reply-To: abebeaemro99@gmail.com
Sender: dr.bashamaugustin@gmail.com
Received: by 2002:a05:6020:61c8:b0:27b:3b8f:c90 with HTTP; Mon, 22 May 2023
 04:02:29 -0700 (PDT)
From:   Abebe Aemro Selassie <abebeaemro99@gmail.com>
Date:   Mon, 22 May 2023 04:02:29 -0700
X-Google-Sender-Auth: ypZaGnPhFTcNlXzEQcie6hBndkg
Message-ID: <CAAkDsN4OpqfyWFY+dVz=J3tcD9pVrCMsRHg-DQrEd4KBbbYPFg@mail.gmail.com>
Subject: Dear Friend,
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: Yes, score=6.1 required=5.0 tests=BAYES_50,DEAR_FRIEND,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        FREEMAIL_REPLYTO_END_DIGIT,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,UNDISC_MONEY autolearn=no autolearn_force=no
        version=3.4.6
X-Spam-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
        *      https://www.dnswl.org/, no trust
        *      [2a00:1450:4864:20:0:0:0:336 listed in]
        [list.dnswl.org]
        *  0.8 BAYES_50 BODY: Bayes spam probability is 40 to 60%
        *      [score: 0.5000]
        *  0.2 FREEMAIL_REPLYTO_END_DIGIT Reply-To freemail username ends in
        *      digit
        *      [abebeaemro99[at]gmail.com]
        * -0.0 SPF_PASS SPF: sender matches SPF record
        *  0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
        *      provider
        *      [abebeaemro99[at]gmail.com]
        *  0.0 SPF_HELO_NONE SPF: HELO does not publish an SPF Record
        *  2.6 DEAR_FRIEND BODY: Dear Friend? That's not very dear!
        * -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
        *  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
        *       valid
        * -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
        *      author's domain
        * -0.1 DKIM_VALID_EF Message has a valid DKIM or DK signature from
        *      envelope-from domain
        * -0.0 T_SCC_BODY_TEXT_LINE No description available.
        *  2.7 UNDISC_MONEY Undisclosed recipients + money/fraud signs
X-Spam-Level: ******
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Greetings From Mr. Abebe Aemro Selassie

I have a Mutual/Beneficial Business Project that would be beneficial
to you. I only have two questions to ask of you, if you are
interested.

1. Can you handle this project?
2. Can I give you this trust?

Please note that the deal requires high level of maturity, honesty and
secrecy. This will involve moving some money from my office, on trust
to your hands or bank account. Also note that i will do everything to
make sure that the money is moved as a purely legitimate fund, so you
will not be exposed to any risk.

I request for your full co-operation. I will give you details and
procedure when I receive your reply, to commence this transaction, I
require you to immediately indicate your interest by a return reply. I
will be waiting for your response in a timely manner.

Best Regard,
Mr. Abebe Aemro Selassie
