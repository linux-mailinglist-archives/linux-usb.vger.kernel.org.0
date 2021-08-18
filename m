Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0A0413EFA8C
	for <lists+linux-usb@lfdr.de>; Wed, 18 Aug 2021 08:02:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237998AbhHRGCq (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 18 Aug 2021 02:02:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43474 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238014AbhHRGCp (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 18 Aug 2021 02:02:45 -0400
Received: from mail-pj1-x1044.google.com (mail-pj1-x1044.google.com [IPv6:2607:f8b0:4864:20::1044])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3E61EC061796
        for <linux-usb@vger.kernel.org>; Tue, 17 Aug 2021 23:02:11 -0700 (PDT)
Received: by mail-pj1-x1044.google.com with SMTP id cp15-20020a17090afb8fb029017891959dcbso8230489pjb.2
        for <linux-usb@vger.kernel.org>; Tue, 17 Aug 2021 23:02:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:reply-to:sender:from:date:message-id:subject:to;
        bh=l8/06Pt7vp+QnEaozw4jU2IiSWTeFeipDK9alaB1bSQ=;
        b=UJWk6KPwfxnvcfNg/0rqbxLQH9PCm1HvtRxYRLoFIcYVMZA2YW/2S88lTYXk0TsqWn
         DjcL9tCRAwbEpVK9cNx/2snvfUao+aPJHaY61h9WmHcoVleZUBMrzRrqUvPaMUTwh39S
         x1ViUcWqmz3qRbNSTYwVBlbYShRHewv+GCSs2BLE27hQ3QpV40SUqZugpEYrZ3hp/Ckh
         +sUlNQIBaZ/PwqvDb+OsbrmGs46c67QEPNgeJ7noO8R9UfcGe4hV3XLLWBG5kzGrC+ID
         XqKxxVIqcUGm5gScaQFfMjJZEQESUT7m0TLGCg6E/RjBKientZtDrcDF+cLCjFgtNll2
         ud8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:reply-to:sender:from:date
         :message-id:subject:to;
        bh=l8/06Pt7vp+QnEaozw4jU2IiSWTeFeipDK9alaB1bSQ=;
        b=WHrCwfwVsLu6s8jFhQxGa0auY/oUZzLdV3eaIFWV3cA/Nahn0xm+s05cBCLrAp/wJf
         slBUe/2LA1HTnfsvE3e++IsswZ5yH1iLQc7QFIAFnNtml+uafIID87WUgFfaa50RqLcp
         7T5md2rsPCO0K13QewNULKG1KyjtSAiOgdYBGVKKp4j6F29yNv5N30BNFKU/rNxgmm9h
         o0hJKShjpCj8THzMi422JrNca0zZKH0Sk+iVbrtMsnEp1v4A9trjrswDUPlR6xKyTc2B
         vVyGRQssO6GWUXefnqHVBaxVpIFj7XD1vC73YPv5HfgGCBaHXzpeeVd5ELIsKLPdADjS
         Cuhw==
X-Gm-Message-State: AOAM532rBs+y44xF2AAeCBmEOm9R9FYQ+kYUAk5uF1sbh+wvj8/sS8hA
        +kEpnNHPBCbvJHx5MtA8BN6AZ0wsvJ+rkyOSpJw=
X-Google-Smtp-Source: ABdhPJzVb9Uwo0ZOH7RNxKMUu4C8UauNzAF6+VoiNlUbA0TvQq2t7Q+ChL5WO5GemDV+HCldsa/DUjjvMRS/NVN+1T4=
X-Received: by 2002:a17:90a:c28d:: with SMTP id f13mr7553839pjt.73.1629266530513;
 Tue, 17 Aug 2021 23:02:10 -0700 (PDT)
MIME-Version: 1.0
Reply-To: godwinppter@gmail.com
Sender: sler002chry@gmail.com
Received: by 2002:a17:90a:d812:0:0:0:0 with HTTP; Tue, 17 Aug 2021 23:02:09
 -0700 (PDT)
From:   Godwin Pete <godwinnpeter@gmail.com>
Date:   Wed, 18 Aug 2021 08:02:09 +0200
X-Google-Sender-Auth: Ib2rEpF_N-2Azu1fYCYV4LLKkro
Message-ID: <CAD9ryRQYVQ1SaNOueemEfoNW8PUPKsux8J=a70cOWnEpCwkxzw@mail.gmail.com>
Subject: For your information
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi,

I just want to use this little opportunity to inform you about my
success towards the transfer. I'm currently in India for an investment
with part of my share, after completing the transfer with an Indian
business man. But i will visit your country, next year. After the
completion of my project here in India. Please, contact my secretary
to send you the (ATM) card which I've already credited with the sum of
($500,000.00). Just contact her to help you in receiving the (ATM)
card. I've explained everything to her before my trip to India. This
is what I can do for you because, you couldn't help in the transfer,
but for the fact that you're the person whom I've contacted initially,
for the transfer. I decided to give this ($500,000.00) as a
compensation for being contacted initially for the transfer. I always
try to make the difference, in dealing with people any time I come in
contact with them. I'm also trying to show that I'm quite a different
person from others whose may have a different purpose within them. I
believe that you will render some help to me when I, will visit your
country, for another investment there. So contact my secretary for the
card, Her contact are as follows,

Full name: Mrs, Jovita Dumuije,
Country: Burkina Faso
Email: jovitadumuije@gmail.com

Thanks, and hope for a good corporation with you in future.

Godwin Peter,
