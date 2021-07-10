Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7418F3C348A
	for <lists+linux-usb@lfdr.de>; Sat, 10 Jul 2021 15:02:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231972AbhGJNFV (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 10 Jul 2021 09:05:21 -0400
Received: from cable.insite.cz ([84.242.75.189]:45923 "EHLO cable.insite.cz"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231164AbhGJNFV (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Sat, 10 Jul 2021 09:05:21 -0400
X-Greylist: delayed 583 seconds by postgrey-1.27 at vger.kernel.org; Sat, 10 Jul 2021 09:05:21 EDT
Received: from localhost (localhost [127.0.0.1])
        by cable.insite.cz (Postfix) with ESMTP id 84404A1A3D402;
        Sat, 10 Jul 2021 14:52:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=ivitera.com; s=mail;
        t=1625921571; bh=rz/jfY4gdum34Lyuros8G2I863m3I4NvyPB5u+dE+n4=;
        h=To:Cc:From:Subject:Date:From;
        b=iCS7Z8f7QmFu+B/uB2EQsXG/yCu/01NolVkF90wwJnkE5bEqP3vpdvkredAxf9NI+
         yeTocVQ8+Zil/c+QQZcR3JUq9Z9QnkDvaOVwa+Ix9jraQ18sxSeQ/7PJaTPosB9Qfm
         i2pi4j4hCCIiq8rh6rNUAjWW3I3QEafFUfKmeeRI=
Received: from cable.insite.cz ([84.242.75.189])
        by localhost (server.insite.cz [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id YNgzzBEOIZn7; Sat, 10 Jul 2021 14:52:46 +0200 (CEST)
Received: from [192.168.105.22] (ip28.insite.cz [81.0.237.28])
        (Authenticated sender: pavel)
        by cable.insite.cz (Postfix) with ESMTPSA id DD38EA1A3D401;
        Sat, 10 Jul 2021 14:52:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=ivitera.com; s=mail;
        t=1625921566; bh=rz/jfY4gdum34Lyuros8G2I863m3I4NvyPB5u+dE+n4=;
        h=To:Cc:From:Subject:Date:From;
        b=USGaHtGpf9XEeYbzyivUVu+66Aei8DVvFdGXgocw3o0Xg49W2vOWpKcO8AgN7Xz1Y
         dqgqXlAWj6d6yfbcNVbbfDd+5YiJKkik7KwDNDw+4k8tfr5BXvM7cXUL6s+7WFjRvX
         hvQetL859UvzuymeAV7RqfYxNDsx4zF4yMdSjKXY=
To:     "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Cc:     Ruslan Bilovol <ruslan.bilovol@gmail.com>,
        Felipe Balbi <balbi@kernel.org>,
        Jerome Brunet <jbrunet@baylibre.com>
From:   Pavel Hofman <pavel.hofman@ivitera.com>
Subject: [PATCH 0/4] usb: gadget: audio: add bi-directional volume and mute
 support
Message-ID: <c8822d7b-019d-aeb0-4e05-406e75da17d3@ivitera.com>
Date:   Sat, 10 Jul 2021 14:52:41 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-2
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi,

These are patches implementing volume and mute support in audio gadget from Ruslan Bilovol 
https://patchwork.kernel.org/project/linux-usb/list/?series=439931 rebased 
for the latest async feedback patches (Ruslan authored, Jerome modified)
already pushed to mainline.

Patches 1 and 4 are basically intact, patches for f_uac2 had to be modified 
for the changes in the final feedback patches.

I tested the f_uac2 code to work correctly.

Rebased patches for switching among multiple rates originally authored by Julian Sheel
https://lore.kernel.org/patchwork/patch/803422/
are to follow, thank you for reviewing and accepting this patchset first.

Best regards,

Pavel Hofman.


