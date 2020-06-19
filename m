Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 097D71FFF36
	for <lists+linux-usb@lfdr.de>; Fri, 19 Jun 2020 02:22:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728083AbgFSAWC (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 18 Jun 2020 20:22:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33596 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727065AbgFSAWB (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 18 Jun 2020 20:22:01 -0400
Received: from mail-il1-x142.google.com (mail-il1-x142.google.com [IPv6:2607:f8b0:4864:20::142])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A8CFFC06174E
        for <linux-usb@vger.kernel.org>; Thu, 18 Jun 2020 17:22:00 -0700 (PDT)
Received: by mail-il1-x142.google.com with SMTP id e11so7740833ilr.4
        for <linux-usb@vger.kernel.org>; Thu, 18 Jun 2020 17:22:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=fNRASbBt9zQHJPJL74raiMJFRtETYcD5GUAcYJlCowc=;
        b=qtECMyoqQWnFq4e9GBk40AxxBC2RL3u9esAk0ruwcXs6IFAUfNkfQJO6b0imR1V6qe
         X5YlPECjagkbh9YQgytMAQhuMCwKAUiKY0AeCiVRdqD68WN63iQDzy/9NiI/YW0ZRQks
         ELaOcmoGb28kNzIHD4vVabUZWalse316HzSMFiTk/uF9OmF44PdSMCgGgP6YdL1cEhvV
         NWhPcZA01BxUDTjSYPc2lRw2/KVk9ePxjGrVoSJCViZuoAPbtJAr2pZbXuktpSVsmIfJ
         iD9Y/pn4JtRQKXv9dBiubft6/gUlrCC0CqJKew2U9YLZhFkay5fPwmBsVP+vNwzIQ1sm
         4hcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=fNRASbBt9zQHJPJL74raiMJFRtETYcD5GUAcYJlCowc=;
        b=CN2U9qlqQL4Xubmc+RDSmEKWiF0gxetiUqHs0LDuUV+x5BQHWXsAlVGh1sOgY2Owj2
         BdhhWvl5Wr+ktOaHIB0hVqP758NoU3ZFwcSbPhl+POB9Jgb1qA24fnI3kEXXea+SWUyQ
         hZtieD0PrsYSR9IVGCwCX1hANpBjOX/bX080OM7cwa0tYd+5b6P4TfjjokREBtT1OdI6
         Ct0WZ6hSLzxxXeaI34JPS+XmntQ4VPc/DVPDIMn+0ArYCCz2pbhqaQkaNqe2z6+nTywz
         MXzJYAbdgj3mqbxxRxuf9S961kanhFB/wYRdhO48TvWlxSt0iGpRjmCGVbn364u1yi/T
         7PEg==
X-Gm-Message-State: AOAM530UDU1jaIzXOU8aAZh3/3zIBfqs+2+GwnBn39M+KbOZjnHVYX0y
        /cXTyuEMrcfRtJ6MxbsCz0CULIP8fSGsSsOb0io=
X-Google-Smtp-Source: ABdhPJy7QGwoLnKuLr1TIDw0F87qtA5p+HbX4ZoD8gKVEQwucQgIVBRFeBu0Wd/Z9iRvyegIzZrOsWu8R2+hEmJaD+s=
X-Received: by 2002:a05:6e02:ca:: with SMTP id r10mr1106806ilq.274.1592526118646;
 Thu, 18 Jun 2020 17:21:58 -0700 (PDT)
MIME-Version: 1.0
References: <20200617125924.1696-1-charlesyeh522@gmail.com> <39139fa7cc7f4ee5bcf8469fa3100797@quantatw.com>
In-Reply-To: <39139fa7cc7f4ee5bcf8469fa3100797@quantatw.com>
From:   Charles Yeh <charlesyeh522@gmail.com>
Date:   Fri, 19 Jun 2020 08:21:46 +0800
Message-ID: <CAAZvQQ5PmdadCvd_D8V_YL_tn+yQKBzSx0bGoHMx8cRN9HTYiA@mail.gmail.com>
Subject: Re: [PATCH] USB: serial: pl2303: Add new chip to support Chrome OS
To:     =?UTF-8?B?VmVyYSBXYW5nICjnjovoqanpg4Ep?= <Vera.Wang@quantatw.com>
Cc:     "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        "johan@kernel.org" <johan@kernel.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "charles-yeh@prolific.com.tw" <charles-yeh@prolific.com.tw>,
        =?UTF-8?B?VGltIENoZW4gKOmZs+eri+W6rSk=?= <Tim-Chen@quantatw.com>,
        =?UTF-8?B?QmVuIExpbiAo5p6X5pet5b69KQ==?= <BenLin@quantatw.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Pg0KPiBIaSBDaGFybGVzLA0KPiDoq4vllY/mnInpgKPntZDll44/IOaYr+WQpuaWueS+v+ebtOaO
peaPkOS+m+mAo+e1kOe1puaIkeWAkT8NCj4NCg0KMS4gUGxlYXNlIGlnbm9yZSB0aGVzZSBDaGlu
ZXNlIHN0cmluZ3MuDQoyLiBWZXJhLCBJIGRvbuKAmXQgaGF2ZSB3ZWItbGluayBoZXJlLg0KDQpD
aGFybGVzLg0K
