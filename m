Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B53EA155B43
	for <lists+linux-usb@lfdr.de>; Fri,  7 Feb 2020 16:57:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727471AbgBGP5C (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 7 Feb 2020 10:57:02 -0500
Received: from mail-io1-f66.google.com ([209.85.166.66]:35614 "EHLO
        mail-io1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726956AbgBGP5B (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 7 Feb 2020 10:57:01 -0500
Received: by mail-io1-f66.google.com with SMTP id h8so57726iob.2
        for <linux-usb@vger.kernel.org>; Fri, 07 Feb 2020 07:57:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:reply-to:in-reply-to:references:from:date:message-id
         :subject:to:content-transfer-encoding;
        bh=u2350BC6Tj+VGKH42GVsogueTiuUeAkWfuCJy5MqcTU=;
        b=A98CG2S5b9Sf33XGqS6Gg1vAx+H9ceExh9c5IyIgx5+KN5tZmxFpazaacmZ9N41FPr
         6bBvn74GYx8blR8kOCyG4ez3Exu04NbZ/Ung1fTr/wkh7yE5cEKQg86BSl29/ssFTfkN
         CR7rUJcyQ1y5bpDNYxmceUw8Udhld2mqXJrbXTpw3hTYs5sty7UCjobQYfwRShmVeqUb
         AHeos7404mk7s3FIFmmBiQDqPCOAXhY6zmIz6I61y8z16j30+FS7/iPBez9TOBpcj6bg
         MeAq58R5U100Q1gaGcZOmTbA7GPZb8m4EisgrV6b/zJVUEi3mvtR4gAgpZ4DBVzBqn/T
         223A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:reply-to:in-reply-to:references
         :from:date:message-id:subject:to:content-transfer-encoding;
        bh=u2350BC6Tj+VGKH42GVsogueTiuUeAkWfuCJy5MqcTU=;
        b=Jz2Q+RDFKzJYBy4g+Ne1/AZAJQhViEP6CWfTg8osQBkRu4J0dQVXj5mh07te+3v5GT
         Eu7h6jWhSvWmARTamyvtqd8oABoOuoQl6ARxEYTtvo6+rcgZL7OZVdCnVtMmEd25WQ/A
         LNI/t6lspC5Dn1LVQmuGZzg+Uj4NWayJEz6qa3k5ZCJ7tTdyA5Bdo66NQWSykfefs3d2
         5SrYSHA6/FuPg6UUqit18Ek92uZPBQtySR0vl9iTJDLjTIyucepxHO0uYwE9m0KvzF3w
         v0dHOcq70gBzTgL15N+u5+vtLp1cqj16oZMl/+PEapX1QMNFGb7QF1UeIDT5lG7rDDy5
         Wc3Q==
X-Gm-Message-State: APjAAAXCldnm6m2bkJwCBF5CY0aBmtvG8SvvCEh/8nYuLh3xx+BV1Llp
        kx2NcRqifsmrIhggXP4llT50cVKhs+zULCQEJFA=
X-Google-Smtp-Source: APXvYqwk8HQYFWGp2f4bHuPrgsyu3uAn1uU/t8zMS84bLlHMYSLfVSNMEjyvY//sLePD/v+gNg5hy+XjLshIbsAFWIk=
X-Received: by 2002:a5e:a616:: with SMTP id q22mr35421ioi.250.1581091021067;
 Fri, 07 Feb 2020 07:57:01 -0800 (PST)
MIME-Version: 1.0
Received: by 2002:a05:6622:1ac:0:0:0:0 with HTTP; Fri, 7 Feb 2020 07:57:00
 -0800 (PST)
Reply-To: angela2egom@gmail.com
In-Reply-To: <CAAWG6cJ2Z-tb__B-1i7-4U2W9xxaOTr0T5swNApOVzxenHmhuw@mail.gmail.com>
References: <CAAWG6cK1oik6eeYm1fWmvFAhM+2VYCHBJhQy7hphV8DTn8rUHw@mail.gmail.com>
 <CAAWG6cJ2Z-tb__B-1i7-4U2W9xxaOTr0T5swNApOVzxenHmhuw@mail.gmail.com>
From:   Jerry Michael <dhlcompanytgo@gmail.com>
Date:   Fri, 7 Feb 2020 15:57:00 +0000
Message-ID: <CAAWG6cLQSAUb0d2rSfV413Pk=UruNGR4mwwW33UZrreqxofPCQ@mail.gmail.com>
Subject: Fwd:
To:     dhlcompanytgo <dhlcompanytgo@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Pg0KDQotLS0tLS0tLS0tIEZvcndhcmRlZCBtZXNzYWdlIC0tLS0tLS0tLS0NCkZyb206IEplcnJ5
IE1pY2hhZWwgPGRobGNvbXBhbnl0Z29AZ21haWwuY29tPg0KRGF0ZTogRnJpLCA3IEZlYiAyMDIw
IDE0OjQ0OjAyICswMDAwDQpTdWJqZWN0Og0KVG86IGRobGNvbXBhbnl0Z28gPGRobGNvbXBhbnl0
Z29AZ21haWwuY29tPg0KDQrQl9C00YDQsNCy0YHRgtCy0YPQuSwg0LTQvtGA0L7Qs9C+0LksDQoN
CtCa0LDQuiDRgtCy0L7QuCDQtNC10LvQsD8g0KLRiyDQv9C+0LvRg9GH0LjQuyDQvNC+0LUg0L/Q
vtGB0LvQtdC00L3QtdC1INC/0LjRgdGM0LzQvj8g0J/QvtC20LDQu9GD0LnRgdGC0LAsINGB0YDQ
vtGH0L3Qvg0K0L7RgtCy0LXRgtGMISDQodC/0LDRgdC40LHQviDQt9CwINC/0L7QvdC40LzQsNC9
0LjQtS4NCg0K0KEg0L3QsNC40LvRg9GH0YjQuNC80Lgg0L/QvtC20LXQu9Cw0L3QuNGP0LzQuA0K
DQrQnNC40YHRgtC10YAg0JTQttC10YDRgNC4INCc0LDQudC60LsNCg==
