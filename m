Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A55BE5529A1
	for <lists+linux-usb@lfdr.de>; Tue, 21 Jun 2022 05:14:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344940AbiFUDNW (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 20 Jun 2022 23:13:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42494 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344951AbiFUDNW (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 20 Jun 2022 23:13:22 -0400
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com [IPv6:2607:f8b0:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C5FB012610
        for <linux-usb@vger.kernel.org>; Mon, 20 Jun 2022 20:13:20 -0700 (PDT)
Received: by mail-pf1-x443.google.com with SMTP id d17so2895471pfq.9
        for <linux-usb@vger.kernel.org>; Mon, 20 Jun 2022 20:13:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:reply-to:from:date:message-id:subject:to;
        bh=MUPE+WCKiaoxRAdnteR3TsIHrvUD8FAr/F1eBQt4pX0=;
        b=VuxBloebgqYs6q47Hdp+hDzN42mMVAk49JQ3qzvYsp/hBTLXwJUXe1nKHE9Wo/tnlx
         FV+L4G/9jcqPBdyoIX/TL2fsi0acPWP2hDAvGb8O4kl+ridK3PcU2FhUwJw2G5+Bnr5B
         5WX/yEwjh7lYUeXbLA2P332gBoFikewQngvBoQFGCEIVq4MA5neFJVHBJXbgXGyAazX2
         S3QkawbW6dC+1fS3tJAH+glmKoNyFUhi02lDAl/e/GXF3A/8p5/q07pGoSzpx+1U16ch
         OCjqW+IDf1TVsoAldLDPHP+ieOZbzPpEFWmg5dCea0Ifhpe8TIdioNJ3w7TTI9e7wkxN
         uFaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:reply-to:from:date:message-id
         :subject:to;
        bh=MUPE+WCKiaoxRAdnteR3TsIHrvUD8FAr/F1eBQt4pX0=;
        b=N9XnVuhoaf7QccV98k1vZagUenD9Ew5BoPuQi5HHeg0uLQC1G2Z0OATG+TBfsy4hWH
         jdl4VT0tvL0YonVEOYZIh9Pf6FmDXaQX6C+SieIuKctIt57g1+JwCWiOhxMxssQ3qlTz
         DhtXXlxFZtBfyRy4NfTdV717tGjG5WWidTmhotY4JBdN2JDTDrAr3Eequb5bugi9fLiQ
         gAZkTpKJp0BX327J6+2hzATE1FmP8wwn8vnteZXcpRCPKY5JelmY5jyvIl6P4CP3RBru
         DV3LhZawp6Ea/1SRNzzfYBg+iJiWiv3ZmAGi0nG++4ZDZAYGX0bT29Bm6Lj0UGFNTd0z
         SU1g==
X-Gm-Message-State: AJIora+34I3REg7XkHWiy95pfE7HTnzFqjdvbU45oKasrZo+5O4xUNLD
        MZCWFrHWDpkmwV9tQD+iTEEpRVJzLq/EcTO7+oI=
X-Google-Smtp-Source: AGRyM1vPILnufbOgVS46XEALHToRWDWJz9CMAN1pqRSwT+bCE/w+2MR3KNWyllBbK1FCvUfXfsMeNimOzK/kVCQOmF8=
X-Received: by 2002:a63:4a4d:0:b0:401:9f40:26a7 with SMTP id
 j13-20020a634a4d000000b004019f4026a7mr24688786pgl.282.1655781200308; Mon, 20
 Jun 2022 20:13:20 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a05:7300:3726:b0:69:5676:9027 with HTTP; Mon, 20 Jun 2022
 20:13:19 -0700 (PDT)
Reply-To: jerrydosso@hotmail.com
From:   Jerry Dosso <jerry20dosso@gmail.com>
Date:   Tue, 21 Jun 2022 05:13:19 +0200
Message-ID: <CAHfM5QYEBY0PFE0sK4_q__d1U3Cm0T=5KGYaRAhQLOXSTL81Lw@mail.gmail.com>
Subject: Mr Jerry Dosso
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=3.8 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,FREEMAIL_REPLYTO,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        UNDISC_FREEM autolearn=no autolearn_force=no version=3.4.6
X-Spam-Level: ***
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

-- 
My Dear Friend,

Did you receive the message i sent to you?

Regards,

Mr Jerry Dosso
