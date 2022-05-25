Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E6C185339A8
	for <lists+linux-usb@lfdr.de>; Wed, 25 May 2022 11:13:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233875AbiEYJNp (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 25 May 2022 05:13:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33396 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238226AbiEYJNP (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 25 May 2022 05:13:15 -0400
Received: from mail-oa1-x34.google.com (mail-oa1-x34.google.com [IPv6:2001:4860:4864:20::34])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 753AB7037E
        for <linux-usb@vger.kernel.org>; Wed, 25 May 2022 02:09:39 -0700 (PDT)
Received: by mail-oa1-x34.google.com with SMTP id 586e51a60fabf-f2bb84f9edso2160001fac.10
        for <linux-usb@vger.kernel.org>; Wed, 25 May 2022 02:09:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:from:date:message-id:subject:to
         :content-transfer-encoding;
        bh=dFTKEpXIrM/6g2eGl0g5bix+Dct0RGMmKqZaXtoxR6o=;
        b=q0XAaEK+pLmEpxHnL195LN3Lt4sGy6+Ceauak0M6Axuus80GSU/AhaEISs7y9KBCL0
         P4JnIZ4uQX3amDcEJikl0g8HtMZ2IOTxB1rTY9QxGx6nNuRbulKNR+/rD9RV0dazI+4v
         Al+TSA4HrGu/YlH9NNchrJZPG6YP/8Hfu56GUWbJHhKpbDDDmr8Zgn458+X6FDpNMu7W
         fCzh4qdFgZ4Wf1Is0b4QYLFb3eO2W6zg92i0m8+Ugfg3He3HEXon6fsjmdphHv+ko0ts
         KY7VC6lXkswN25k0f/mifYOnqjrjWM5ODz2dR+IUBfXBCLSri+jcIYXrjQLY+bsnbG9F
         d+NQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to
         :content-transfer-encoding;
        bh=dFTKEpXIrM/6g2eGl0g5bix+Dct0RGMmKqZaXtoxR6o=;
        b=lT+XkrETs8K3vymg6IpuX6DLv2d9B1hQc3IUGKJes8ZVkOSc+0Cm6f8uiwlf630pPH
         njNl6VFvYHT5jbVI0uEJ0EcYZ/gv/ifTk3012q5pcfN7jTW60OL0fVU01NRY/02Bq7Qi
         6J70U7ryH2iAKgenlWhcZHeg7IRwJGO3TGvyrTiLugwPL+zEI2ab9r7J4HVtCyH9D3oS
         jNOOt5X45uq2nhp4vQzEzv4TDcOj9RqlgPpa3Kdny03OVKRoS5tewOEAkAVHqntUJJ8s
         +T4VLuPog8ej9BkUT3B1ofJPKpJ7NUhsXxH9F8ZwBVBt7oSGJM+jVH5r2YXTp9Z8ROi7
         i7wA==
X-Gm-Message-State: AOAM530H4EDpfRMTCj4He1EXHD7L/DMs3WAH56/4yxIyjilj9x9d5uAX
        txiTXMvdt1NQWAne0q2Qaka1qOQvxI3ce5EppBc=
X-Google-Smtp-Source: ABdhPJxSaE0FXo2491MyDiF5SuiszE8mCoLxYQ2/tD6N8nUPbDsEuoGNmu4nR84mMv9txIH9Ii5ead0e6fmume8PxgE=
X-Received: by 2002:a05:6870:5703:b0:f2:c3a5:e514 with SMTP id
 k3-20020a056870570300b000f2c3a5e514mr750716oap.32.1653469778810; Wed, 25 May
 2022 02:09:38 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a05:6820:548:0:0:0:0 with HTTP; Wed, 25 May 2022 02:09:38
 -0700 (PDT)
From:   Mrs Cristina Campbell <cristtinacampbell@gmail.com>
Date:   Wed, 25 May 2022 10:09:38 +0100
Message-ID: <CAArciVpRj-TQjSNYypFOP8+2f25Yp9tW13-RnubasKwizARnNQ@mail.gmail.com>
Subject: Kun je me helpen?
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=3.5 required=5.0 tests=BAYES_60,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,FREEMAIL_REPLY,
        LOTS_OF_MONEY,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_HK_NAME_FM_MR_MRS,T_SCC_BODY_TEXT_LINE,UNDISC_MONEY autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Level: ***
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Beste geliefde,

Lees dit alstublieft langzaam en aandachtig door, want het is
misschien wel een van de belangrijkste e-mails die u ooit krijgt. Ik
ben mevrouw Cristina Campbell, ik was getrouwd met wijlen Edward
Campbell. Hij werkte vroeger voor Shell Petroleum Development Company
London en was ook een doorgewinterde aannemer in de regio Oost-Azi=C3=AB.
Hij stierf op donderdag 31 juli 2003 in Parijs. We waren zeven jaar
getrouwd zonder kind.

Terwijl je dit leest, wil ik niet dat je medelijden met me hebt, want
ik geloof dat iedereen op een dag zal sterven. Er is bij mij
slokdarmkanker vastgesteld en mijn dokter vertelde me dat ik het niet
lang zou volhouden vanwege mijn gecompliceerde gezondheidsproblemen.

Ik wil dat God mij genadig is en mijn ziel accepteert, dus ik heb
besloten om aalmoezen te geven aan
liefdadigheidsorganisaties/kerken/boeddhistische
tempels/moskee/moederloze baby's/minder bevoorrechte en weduwen omdat
ik wil dat dit een van de laatste goede daden is Ik doe op aarde
voordat ik sterf. Tot nu toe heb ik geld uitgedeeld aan een aantal
liefdadigheidsorganisaties in Schotland, Wales, Panama, Finland en
Griekenland. Nu mijn gezondheid zo achteruit is gegaan, kan ik dit
zelf niet meer.

Ik heb ooit leden van mijn familie gevraagd om een =E2=80=8B=E2=80=8Bvan mi=
jn
rekeningen te sluiten en het geld dat ik daar heb te verdelen aan
liefdadigheidsorganisaties in Oostenrijk, Nederland, Duitsland, Itali=C3=AB
en Zwitserland, ze weigerden en hielden het geld voor zichzelf. Daarom
vertrouw ik het niet ze niet meer, omdat ze niet lijken te strijden
met wat ik voor hen heb achtergelaten. Het laatste van mijn geld
waarvan niemand weet, is de enorme contante storting van zes miljoen
Amerikaanse dollars $ 6.000.000,00 die ik heb bij een bank in Thailand
waar ik het fonds heb gestort. Ik wil dat u dit fonds gebruikt voor
liefdadigheidsprogramma's en de mensheid in uw land steunt, als u maar
oprecht bent.

Ik nam deze beslissing omdat ik geen kind heb dat dit geld zal erven,
ik ben niet bang voor de dood, daarom weet ik waar ik heen ga. Ik weet
dat ik in de boezem van de Heer zal zijn. Zodra ik uw antwoord heb
ontvangen, zal ik u de contactpersoon van de Bank bezorgen en u een
machtigingsbrief geven die u als oorspronkelijke begunstigde van dit
fonds in staat stelt om dit liefdadigheidsprogramma onmiddellijk in uw
land te starten.

Alleen een leven voor anderen is een leven dat de moeite waard is. Ik
wil dat je altijd voor me bidt. Elke vertraging in je antwoord zal me
ruimte geven om een =E2=80=8B=E2=80=8Bandere persoon voor hetzelfde doel te=
 zoeken.
Als u niet ge=C3=AFnteresseerd bent, neem dan alstublieft contact met mij
op. Je kunt me bereiken met of reageren op mijn priv=C3=A9-e-mailadres:
(cristinacampel@outlook.com).

Bedankt,
Hoogachtend,
Mevrouw Cristina Campbell
E-mail; cristinacampel@outlook.com
