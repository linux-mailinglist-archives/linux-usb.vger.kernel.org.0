Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 00090CD8F0
	for <lists+linux-usb@lfdr.de>; Sun,  6 Oct 2019 21:37:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726204AbfJFThb (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 6 Oct 2019 15:37:31 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:39995 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1725811AbfJFThb (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 6 Oct 2019 15:37:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1570390650;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=md1VGHpPCYWdmA8M50yw1vhe+847XkUmuOiHBgmLIBk=;
        b=iZtgCC0nzoHEBX4exSHJelnsFYLruLqW/N+H2lxHPfvm5Df85SP6k28PcFHq6uCBe+nmFW
        vldgjSudwtV1Ki+sglPIitfqyxBHLfnkUsAJE39PxGxxgquygglNpl6I+H4QXkNftPSYrj
        EEs5HrQlqmhAtWKDCMY9x8oWm3j5vR8=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-232-tGR1TOVWOSOZ0MVY0dhzHw-1; Sun, 06 Oct 2019 15:37:28 -0400
Received: by mail-ed1-f71.google.com with SMTP id p55so7620201edc.5
        for <linux-usb@vger.kernel.org>; Sun, 06 Oct 2019 12:37:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=/EUNnnB4iJj41YotY6xxIusdJj0QHQ51a1QG+BiD0qA=;
        b=SYdrb2LsXYNJBHaPQe/m1Od1HBYIGMlnTZLQQOqCDBBhrWJalT8mYQt8YxVeCe3kqY
         8Vj8N03y610Q77MTHva9tC7VgQq/RDa/NA0wSMmQw+XsT78XI9avI2IjIIISvRDd0jXJ
         ygExqypHl4NEXDN/wPu5Vp9EBgkRlJPpKar+l96W3zqng0g+7jxYPzKyr9o2cL/7yyp3
         vyzBrxZ+/8fFAYWyaTzgyNLVxes0m0eGA1I7KEMAuTvN2OJEoznx5VVwHofWrpZXAtO9
         ch/mx2m9UfBHkHYASsth2ANMTauBeTTAthHJymU0jnaQ4bCTHyzDps513QI+aK28e816
         9Vdw==
X-Gm-Message-State: APjAAAVGjjfJ1LMSieUJaM7I1HMRulFwDVYbiyz7lcrC2R0tYB0e2RXG
        BxqNeLJtv1VzaJfdXUHO1uVass55dPfei5ziufzNYk5QV4BYIad3rC7VHc7a5WBDc4hud1hX2kr
        8s4grq5NHDkRrujdqFhOQ
X-Received: by 2002:a17:907:211c:: with SMTP id qn28mr21138439ejb.244.1570390647346;
        Sun, 06 Oct 2019 12:37:27 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyLjzrJHf2a5ybPPnLlBS2yLENsojjJhdYCI/4qIvlYhNM/K0rhakPMnSidWnf3Mn9TuLRChw==
X-Received: by 2002:a17:907:211c:: with SMTP id qn28mr21138428ejb.244.1570390647136;
        Sun, 06 Oct 2019 12:37:27 -0700 (PDT)
Received: from shalem.localdomain (2001-1c00-0c14-2800-ec23-a060-24d5-2453.cable.dynamic.v6.ziggo.nl. [2001:1c00:c14:2800:ec23:a060:24d5:2453])
        by smtp.gmail.com with ESMTPSA id f6sm2848886edr.12.2019.10.06.12.37.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 06 Oct 2019 12:37:26 -0700 (PDT)
Subject: Re: [PATCH 0/2] extcon: axp288: Move to swnodes
To:     Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc:     MyungJoo Ham <myungjoo.ham@samsung.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org
References: <20191001105138.73036-1-heikki.krogerus@linux.intel.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <b1691d61-313c-ad57-3ef4-2dc2dc8263a2@redhat.com>
Date:   Sun, 6 Oct 2019 21:37:25 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <20191001105138.73036-1-heikki.krogerus@linux.intel.com>
Content-Language: en-US
X-MC-Unique: tGR1TOVWOSOZ0MVY0dhzHw-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi,

On 01-10-2019 12:51, Heikki Krogerus wrote:
> Hi Hans,
>=20
> That AXP288 extcon driver is the last that uses build-in connection
> description. I'm replacing it with a code that finds the role mux
> software node instead.
>=20
> I'm proposing also here a little helper
> usb_role_switch_find_by_fwnode() that uses
> class_find_device_by_fwnode() to find the role switches.

I'm building a kernel with these patches to test them now
(on hw which uses the axp288 extcon code-paths with the role-sw)

No test results yet, but I did notice this will building:

   CC [M]  drivers/extcon/extcon-axp288.o
drivers/extcon/extcon-axp288.c: In function =E2=80=98axp288_extcon_find_rol=
e_sw=E2=80=99:
drivers/extcon/extcon-axp288.c:333:9: warning: assignment discards =E2=80=
=98const=E2=80=99 qualifier from pointer target type [-Wdiscarded-qualifier=
s]
   333 |  swnode =3D software_node_find_by_name(NULL, "intel-xhci-usb-sw");
       |         ^

Regards,

Hans

