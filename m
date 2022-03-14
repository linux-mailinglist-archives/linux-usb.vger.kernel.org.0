Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2CAC84D8552
	for <lists+linux-usb@lfdr.de>; Mon, 14 Mar 2022 13:48:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236597AbiCNMtD (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 14 Mar 2022 08:49:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53726 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241854AbiCNMsO (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 14 Mar 2022 08:48:14 -0400
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com [IPv6:2a00:1450:4864:20::42d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A61B526DB
        for <linux-usb@vger.kernel.org>; Mon, 14 Mar 2022 05:42:51 -0700 (PDT)
Received: by mail-wr1-x42d.google.com with SMTP id e24so23695074wrc.10
        for <linux-usb@vger.kernel.org>; Mon, 14 Mar 2022 05:42:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:reply-to:from:date:message-id:subject:to;
        bh=c0efiEkVxtTkTFENAKnUNGf6D7Eoa+H/DnhrKy6xKHg=;
        b=GH/UfRzxN4Q3s67H7ukUGF5eSERRoRG7Od11IUnz9bBYrw3NoZFnYC5FtzaL9g0Yn0
         kS8qUFP3zfV19m/YphdmSGVb/ZCt7lDo3HCNTZNEc/E+Gk6RS+mCyvBmAw6rGWuNpJ+9
         kjBHMd+3CAs5RshrAOaBOjbG53jlVV0QBLu37rXMnz4jXviGPqqacbAPQRncnZQOlZ/s
         QrBvQ7F72lHFyQrQCcGx6O8YHBwlxTNAvIdmJqr7+eZrNgkMBJ+a4gd88qmlJHpPppCK
         EbY4rFnhjh0frZb0vRo4+IzXFOBvNvTZABFrvfWUkx6Q5XTeTPm34nKXZ83nDwg0sYai
         XmTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:reply-to:from:date:message-id
         :subject:to;
        bh=c0efiEkVxtTkTFENAKnUNGf6D7Eoa+H/DnhrKy6xKHg=;
        b=2TN2ArQlHOLx34v0WBuvu6h28b/i07K9xiVluuvAnTYEnrh2SsKvaiWgOMoMS7OWn9
         GroXQK6QQ+JsIR/o+mDAluKn6WK73KUHXHp2FG9rdohB5qpmesjkqDB4EGQyBderqHfO
         QSP+YeTr/e/uZNhHWcbXVHv7QXNiRRaUCRCXqPel+FbakCqDkocM7A3dtd30ZD2gjVNB
         PTLWrghIDm7i6s5cnISXw1scEITGa275eIvsAjLhta7BA9lAfOcIcXkBt6svWMYAiyOu
         xIT9MVmPJsqT9lGx3iV2Q6ShTT0+Vd19Ji52Z4RIJNVQGXL92gIYmPxmQRnbWZXkG84d
         VLSQ==
X-Gm-Message-State: AOAM533I69qOd9JYYeMl7kDTL3Mdv+J2abTV8iilr1MyjYymsbZlW1um
        rY2gA0C+pqm1xszJPsMftI8msqQ8t1Jz7xwC43k=
X-Google-Smtp-Source: ABdhPJzldOOryepAqzCjRdXnaWWWXADOh20+aqXiUEVOdZUBPxEYxD/+2ZOSULcXkDkBk8VRyCLjucSMznkrAds6fgs=
X-Received: by 2002:adf:f150:0:b0:1f0:6925:722 with SMTP id
 y16-20020adff150000000b001f069250722mr16032477wro.465.1647261769614; Mon, 14
 Mar 2022 05:42:49 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a5d:6489:0:0:0:0:0 with HTTP; Mon, 14 Mar 2022 05:42:49
 -0700 (PDT)
Reply-To: anwarialima@gmail.com
From:   Alima Anwari <khuntamar5@gmail.com>
Date:   Mon, 14 Mar 2022 12:42:49 +0000
Message-ID: <CAOdLAAJcegRwZjoGmomemNYOWPvpuHuix3UpNYOdbHMauOA1rg@mail.gmail.com>
Subject: Greetings
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=4.7 required=5.0 tests=BAYES_40,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,FREEMAIL_REPLYTO,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE,UNDISC_FREEM autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Level: ****
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

-- 
Hello dear friend, i'm Alima Anwari from Afghanistan, please reply
back to me and have an urgent issue to share with you. I will be waiting
for your response.
Thanks.
Alima.
