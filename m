Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B9B1ED28B5
	for <lists+linux-usb@lfdr.de>; Thu, 10 Oct 2019 14:06:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1733090AbfJJMGm (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 10 Oct 2019 08:06:42 -0400
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:57284 "EHLO
        us-smtp-delivery-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1728030AbfJJMGl (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 10 Oct 2019 08:06:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1570709200;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=QLqhEmmSCKlL4Gh+Y3YA/NRWVx/mTIodKwq+1Ev+36s=;
        b=SiSdHckEHKX3QCQH4f3/MUjd/eYN3KuYtu9vYG7cOX7ogrze61uJ3pMR9ngts7XRjp9ZGA
        sNRqZ7GV+JmMd+BLm1zqTplVrG3bv2f1gdQG6E/boQh47fUbW526aa2srM8CiCgMQIXvOs
        NyMg9QFKS3WbGGsBLqsbUq6BnErMyUY=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-124-Kx1t6_OCPDWZFuZ_pubRXg-1; Thu, 10 Oct 2019 08:06:38 -0400
Received: by mail-ed1-f70.google.com with SMTP id c90so3454332edf.17
        for <linux-usb@vger.kernel.org>; Thu, 10 Oct 2019 05:06:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=0i7Jgh5uxOMKeZxcPFVuPgWkbxjfgaDzvKA2rlbDpOs=;
        b=kDEVtHhL/HmlYONa2JFWDvqztjRg/YjfZ4iQXTDLGawPlvYp14Eu7+gnzsy84shRbu
         2LSHdVI3Kf3SSp1h+xs+ydfwvsodMqcRgVuf43n3+jFJ9p8WUbb8M6Lf4B9BP470LiYR
         RdRCrNKlFJ8weLvvCn9dvtsEN57OawD+gD9Kk7Jg4F3yfnQnPGKP51iyY0FgQBXh2Ses
         JuzoW5K4oGedf3kFgn04ErxWQ/iw+FOin2urRkrv4HPn3ZPJbxpgyOniO16hdLEiO1s8
         PlHCQJ8EDc+BdC3h9GwfGhKmJpsTfX9MUsAa8f3gwM3jMjzepgxYDETLGBJdzr59W7yq
         Y+4A==
X-Gm-Message-State: APjAAAURqN8UiZVdk0tF6tHat1XYtYHf01jyXEg6dFxuIcRAhtDIy/o0
        Q+Bd68dwOx39R4dHR09OoeW0Qh/xi4GSXrL9E48m90WYxpcfrE5qe7hKLy4hpurFVLDyPjCI4sm
        DKdqHLYvHabBQsQw3O11s
X-Received: by 2002:aa7:c38f:: with SMTP id k15mr7953475edq.100.1570709196640;
        Thu, 10 Oct 2019 05:06:36 -0700 (PDT)
X-Google-Smtp-Source: APXvYqy21h+E0vvwAqPxtXZ13HG+LjykboK3d9m2l1P2gFKMB6U/5R4krK18EqOX1PoOuJ5S9QcIMQ==
X-Received: by 2002:aa7:c38f:: with SMTP id k15mr7953445edq.100.1570709196447;
        Thu, 10 Oct 2019 05:06:36 -0700 (PDT)
Received: from shalem.localdomain (2001-1c00-0c14-2800-ec23-a060-24d5-2453.cable.dynamic.v6.ziggo.nl. [2001:1c00:c14:2800:ec23:a060:24d5:2453])
        by smtp.gmail.com with ESMTPSA id y25sm652832eju.39.2019.10.10.05.06.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Oct 2019 05:06:35 -0700 (PDT)
Subject: Re: [PATCH v2 0/2] extcon: axp288: Move to swnodes
To:     Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc:     MyungJoo Ham <myungjoo.ham@samsung.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org
References: <20191008122600.22340-1-heikki.krogerus@linux.intel.com>
 <8120fbf2-08d3-6ee2-21bf-458a4e12b29c@redhat.com>
 <20191008140159.GC12909@kuha.fi.intel.com>
 <20191010083110.GA4981@kuha.fi.intel.com>
 <7730d466-53bc-c14a-120f-dcb91de1e973@redhat.com>
 <20191010111620.GB4981@kuha.fi.intel.com>
 <20191010115839.GC4981@kuha.fi.intel.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <4ddcdfe7-7627-6181-7e28-c6d7d63c3e22@redhat.com>
Date:   Thu, 10 Oct 2019 14:06:34 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <20191010115839.GC4981@kuha.fi.intel.com>
Content-Language: en-US
X-MC-Unique: Kx1t6_OCPDWZFuZ_pubRXg-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi,

On 10-10-2019 13:58, Heikki Krogerus wrote:
> On Thu, Oct 10, 2019 at 02:16:23PM +0300, Heikki Krogerus wrote:
>> In any case, do we leave this series as it is now, or should I add two
>> patches to it - one that just removes device_connection_add/remove
>> functions without any other changes, and another patch that removes
>> that device_connection_find() function (together with generic_match
>> etc.)?
>=20
> Forget about it. Let's leave this series as it is now.
>=20
> The device_connection_find() function we can remove separately.

That sounds fine to me. Note as mentioned I would remove the
device_connection_find() function before removing the builtin
connection support, that will make the builtin connection support
removal patch a bit cleaner.

Regards,

Hans

