Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3489851FCD1
	for <lists+linux-usb@lfdr.de>; Mon,  9 May 2022 14:29:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234447AbiEIMcc (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 9 May 2022 08:32:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36876 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234513AbiEIMcb (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 9 May 2022 08:32:31 -0400
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com [IPv6:2a00:1450:4864:20::42c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C9CDD2725D1
        for <linux-usb@vger.kernel.org>; Mon,  9 May 2022 05:28:36 -0700 (PDT)
Received: by mail-wr1-x42c.google.com with SMTP id w4so19186616wrg.12
        for <linux-usb@vger.kernel.org>; Mon, 09 May 2022 05:28:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:reply-to:from:date:message-id:subject:to;
        bh=/rL+TycpMQLfB5P4Zn9xgGfUWg8yPCNTwrE46ZNldMM=;
        b=oxwEnL8tYbpZa93pTl+04/zezbNDACZhddwdl89j/+juWscKypVaLXadWCeH/GMhPb
         iq5W32P3VuG1D+IxSNtyeOqeDY6AAreVCq6kGRFQj7uKO0FuLB3vGaDDzHm75exwlFla
         oJIUrYf5XsqxkiiMpEdh1Q9KM855CDl8xMBiD9pXNNoI+3+LKZnPfMXToiHiQ9UvtNm8
         J+CfhpqXdKNS/1VpTsPLMAT5FYI6eArkZkIZ6b5HIay2BDbEeu21ILuzDiQZR/E/Rz6B
         oF4AI1BDOjsjksMI/DqR6QB97HoJ2xs3CzUBcEE1+97Yggugcbn0TvzwJ7EjSC63gfEY
         SQgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:reply-to:from:date:message-id
         :subject:to;
        bh=/rL+TycpMQLfB5P4Zn9xgGfUWg8yPCNTwrE46ZNldMM=;
        b=Cnr+8GI95kvur8oqciJjd1ptbeX+Akn5hSuNn+nfc4suroo1b1y05r0/l5rvzOhbt6
         1tQYd5I6E1fjEggX9C/YrvMKU8OWPO/PAVSeV6UCbK1+wuMeoVbxM9bjBlaPmBOgezOS
         IZy7nArHbnOehbEpe9dXE7gQh4imGQOSnBjVBojhXs2oFc9oEUbr+hBayKob7wPkz23B
         hMSut6pbIKO2TZxcTXNObISkh5x31Mb0D+lcn+IOEUjFuc9pNr3zcG+ofatC80YtcdiC
         0o8YkQ+asOQFNX8eby1fG3E+yXBHTjKse6N8lWhf0f3Q9mePBTTc1XnLc1sjztC9FXQd
         uBAw==
X-Gm-Message-State: AOAM533+GYXGf6ak1DMzsDMuzg7m9FJoPYExkjsYOubpZiqtMhAKG9OM
        YPk5ljjHenFJ2KVGK5QCkLG91NCcRM39JKI04Rs=
X-Google-Smtp-Source: ABdhPJwq/Ls1ob1HQVAyK91/BvyAxSlSlPo5toShElpE3hNSmYJfXZ/287hQ4BZb+eqX1BL1fSihPscEAHAhmrVA00Q=
X-Received: by 2002:a5d:6d04:0:b0:20c:52de:9ce4 with SMTP id
 e4-20020a5d6d04000000b0020c52de9ce4mr14514237wrq.572.1652099314841; Mon, 09
 May 2022 05:28:34 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a5d:6409:0:0:0:0:0 with HTTP; Mon, 9 May 2022 05:28:33 -0700 (PDT)
Reply-To: dravasmith27@gmail.com
From:   Dr Ava Smith <khanadbul01@gmail.com>
Date:   Mon, 9 May 2022 05:28:33 -0700
Message-ID: <CALr78wWw=o8tKQxWT0f3NTWUiUDKuiYgVNW0s2CputB4_Fqwmg@mail.gmail.com>
Subject: GREETINGS FROM DR AVA SMITH
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: Yes, score=6.1 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,FREEMAIL_REPLYTO,FREEMAIL_REPLYTO_END_DIGIT,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,SUBJ_ALL_CAPS,
        T_SCC_BODY_TEXT_LINE,UNDISC_FREEM autolearn=no autolearn_force=no
        version=3.4.6
X-Spam-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
        *      https://www.dnswl.org/, no trust
        *      [2a00:1450:4864:20:0:0:0:42c listed in]
        [list.dnswl.org]
        *  0.8 BAYES_50 BODY: Bayes spam probability is 40 to 60%
        *      [score: 0.4899]
        *  0.2 FREEMAIL_REPLYTO_END_DIGIT Reply-To freemail username ends in
        *      digit
        *      [dravasmith27[at]gmail.com]
        *  0.5 SUBJ_ALL_CAPS Subject is all capitals
        *  0.0 SPF_HELO_NONE SPF: HELO does not publish an SPF Record
        *  0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
        *      provider
        *      [khanadbul01[at]gmail.com]
        * -0.0 SPF_PASS SPF: sender matches SPF record
        *  0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
        *       in digit
        *      [khanadbul01[at]gmail.com]
        * -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
        *      author's domain
        * -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
        *  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
        *       valid
        * -0.1 DKIM_VALID_EF Message has a valid DKIM or DK signature from
        *      envelope-from domain
        * -0.0 T_SCC_BODY_TEXT_LINE No description available.
        *  3.5 UNDISC_FREEM Undisclosed recipients + freemail reply-to
        *  1.0 FREEMAIL_REPLYTO Reply-To/From or Reply-To/body contain
        *      different freemails
X-Spam-Level: ******
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

-- 
Hello Dear,
how are you today?hope you are fine
My name is Dr Ava Smith ,Am an English and French nationalities.
I will give you pictures and more details about me as soon as i hear from you
Thanks
Ava
